// ==========================================================================
// = Copyright (C) 2013/2015 Seagull Project - Contrato Ref: 20131034063    =
// = -----------------------------------------------------------------------=
// = Parceiros:
// =  - Critical Software - CSW
// =  - Força Aérea Portuguesa - FAP
// =  - Marinha Portuguse - MP 
// =  - Instituto Superior Técnico - IST/ISR
// =  - Faculdade de Eng. do Porto - FEUP
// ==========================================================================
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Project: seagull_communication
// Date:    2014/02/17
// Author:  Pedro Marques da Silva  
// -------------------------------------------------------------------------=
// Description: CommsRelay.cpp
//
// ==========================================================================
//! STD Headers

#include <ros/console.h>
#include <ros/duration.h>
#include <ros/node_handle.h>
#include <ros/timer.h>
#include <rosconsole/macros_generated.h>
#include <seagull_autopilot/TopicsAndServices.h>
#include <seagull_commons_msgs/SeagullHeader.h>

#include <seagull_communication/TopicsAndServices.h>
#include <string.h>
#include <climits>
#include <iterator>
#include <map>
#include <new>
#include <queue>
#include <set>
#include <utility>
#include <vector>

#include <seagull_commons_msgs/SeagullHeartbeat.h>
#include <seagull_commons/TopicsAndServices.h>
#include <seagull_communication/CommsRelay.h>
/**
 *
 */
CommsRelay::CommsRelay() :
    lastMessageId(0), ROSNode(true), txRetries(MAX_TX_RETRIES), ackTimeout(ACK_TIMEOUT), dispatch_rate(
        DEFAULT_DISPATCH_RATE), heartbeat(0)
{

  status.buffer.reserve(RELIABLE_MSG_MAX_SIZE);
  resetParser();

  if (pthread_mutex_init(&lock_receive, NULL) != 0)
  {
    throw std::runtime_error("mutex init failed");
  }

  if (pthread_mutex_init(&lock_send, NULL) != 0)
  {
    throw std::runtime_error("mutex init failed");
  }

}

/**
 *
 */
CommsRelay::~CommsRelay()
{
  pthread_mutex_destroy(&lock_receive);
  pthread_mutex_destroy(&lock_send);
}
/**
 *
 */
void CommsRelay::setup()
{
  setupSubscribers();
  setupPublishers();
  sendWatchdogTimer = getHandle().createTimer(ros::Duration(2.0), &CommsRelay::sendWatchdogTimerCallback, this);
  receivedWatchdogTimer = getHandle().createTimer(ros::Duration(2.0), &CommsRelay::receiveWatchdogTimerCallback, this);

  ROS_INFO("Comms Parameters: timeout (%d) retries(%d) dispatch_rate(%d)", this->ackTimeout, (int )this->txRetries,this->dispatch_rate);
  //! Initialize dispacher task

  heartbeat = new Heartbeater(getHandle(), (uint8_t)seagull_commons_msgs::SeagullHeartbeat::HB_COMMS_RELAY,
                                HEARTBEAT_INTERVAL_MS, seagull_commons::topics::TO_SEC2_HEARTBEAT_TOPIC);

}

/**
 * Create a autopilot a message and publish
 * @param dst Destination address
 * @param data  Data to be sent
 */
void CommsRelay::publishChunk(const uint16_t& dst, const RawData& data)
{
  seagull_autopilot_msgs::AutopilotPayload ap_payload;
  ap_payload.header.vehicleId = dst;
  ap_payload.len = data.size();
  ap_payload.data.assign(data.begin(), data.end());
  uint16_t mid, seq;
  to_autopilot_pub.publish(ap_payload);
}

/**
 *
 * @param requires_ack
 * @param destination
 * @return
 */
ChunkControl* CommsRelay::popValidChunk(bool & requires_ack, uint16_t& destination)
{
  ChunkControl* rv = NULL;
  while (!this->dispatcher_queue.empty())
  {
    rv = dispatcher_queue.top();
    dispatcher_queue.pop();
    {

      if (send_queue.find(rv->message) != send_queue.end())
      {
        requires_ack = send_queue[rv->message].requiresAck;
        destination = send_queue[rv->message].destination;
        break;
      }
    }
  }
  return rv;
}
/**
 *
 */
void CommsRelay::loop()
{
  //TODO verificar o valor do mutex
  arte::thread::ScopedLock(&this->lock_send);
  bool requires_ack = true;
  uint16_t destination = 0;
  ChunkControl * chunk_p = popValidChunk(requires_ack, destination);
  if (chunk_p)
  {
    //! if this chunk does not require ack then the ack
    //! is when is sent
    if (!requires_ack)
    {

#ifdef DEBUG_MODE
      uint16_t t;
      CommsUtils::deserializeType(&(chunk_p->chunkData[5]), t);
      ROS_INFO("Ack  chunk by dispacher: %d", t);
#endif
      chunk_p->ackReceived = true;
    }
    else
    {
#ifdef DEBUG_MODE
      uint16_t t;
      CommsUtils::deserializeType(&(chunk_p->chunkData[5]), t);
      ROS_INFO("Send chunk: %d", t);
#endif
    }

    chunk_p->sentTimestamp = CommsUtils::getTimestamp();
    publishChunk(destination, chunk_p->chunkData);

  }
#ifdef DEBUG_MODE
  else
  {

//    ROS_INFO("Dispatch Queue is empty");
  }
#endif

  ros::spinOnce();
  usleep(1000000 / this->dispatch_rate);
}
/**
 *	Create the publishers instances for each defined topic
 */
void CommsRelay::setupPublishers()
{

  this->from_comms_relay_pub = this->getHandle().advertise<seagull_communication_msgs::SeagullPayload>(
      seagull_communication::topics::FROM_COMMS_RELAY_TOPIC, 100);

  this->to_autopilot_pub = this->getHandle().advertise<seagull_autopilot_msgs::AutopilotPayload>(
      seagull_autopilot::topics::AP_TO_PAYLOAD_TOPIC, 100);
}

/**
 * Create de subscribers instances for each defined topic
 * Assign a callback to each subscriber
 */
void CommsRelay::setupSubscribers()
{

  this->to_comms_relay_sub = this->getHandle().subscribe(seagull_communication::topics::TO_COMMS_RELAY_TOPIC, 1000,
                                                         &CommsRelay::toCommsRelayCallback, this);
  this->from_autopilot_sub = this->getHandle().subscribe(seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 1000,
                                                         &CommsRelay::fromAutopilotCallback, this);
  this->comms_parameters_sub = this->getHandle().subscribe(seagull_communication::topics::COMMS_PARAMETERS_TOPIC, 1000,
                                                           &CommsRelay::commsParametersCallback, this);
}

/**
 * Create a Chunk in raw format
 * @param id	Message ID
 * @param data	Data to transport
 * @param index	Index position of the chunk in the message chunks
 * @return
 */
void CommsRelay::createRawReliableMessage(const uint16_t& id, const std::vector<uint8_t>& data, int index, RawData& m,
                                          uint8_t type)
{
  uint32_t chunkStart = index * CHUNK_MAX_SIZE;
  CommsUtils::serializeReliableMsg(id, &data[chunkStart], index, data.size(), m, type);
}
/**
 *
 * @param message
 */
void CommsRelay::readyToDispatch(MessageItem& message)
{
  // Insert in the dispatch queue
  for (int sequence = 0; sequence < message.nrChunks; ++sequence)
  {
    ChunkControl* chunk_p = &(message.chunks[sequence]);
    chunk_p->sentTimestamp = 0;
    this->dispatcher_queue.push(chunk_p);
  }
}

/**
 * Receive a message from internal system and handle
 * according with protocol:
 * If requires ack then split the message and process
 *    from queues
 * else send all message to the other side
 *
 * @param msg received message
 */
void CommsRelay::toCommsRelayCallback(const seagull_communication_msgs::SeagullPayload::ConstPtr& msg)
{

  uint16_t m_id = nextMessageId();
  arte::thread::ScopedLock(&this->lock_send);
  this->send_queue[m_id].messageId = m_id;
  this->send_queue[m_id].nrChunks = CommsUtils::calculateNrOfChunks(msg->length);

  this->send_queue[m_id].destination = msg->header.vehicleId;

#ifdef DEBUG_MODE
  ROS_INFO("Message of size %d splitted  in %d chunks", msg->length, this->send_queue[m_id].nrChunks);
#endif
  ;
  for (int sequence = 0; sequence < this->send_queue[m_id].nrChunks; ++sequence)
  {
    this->send_queue[m_id].chunks[sequence].ackRetries = 0;
    this->send_queue[m_id].chunks[sequence].sentTimestamp = 0;
    this->send_queue[m_id].tsStart = CommsUtils::getTimestamp();
    createRawReliableMessage(this->send_queue[m_id].messageId, msg->data, sequence,
                             this->send_queue[m_id].chunks[sequence].chunkData,
                             (msg->requiresAck ? RMT_REQUIRES_ACK : RMT_NO_ACK));

    this->send_queue[m_id].chunks[sequence].message = this->send_queue[m_id].messageId;

    this->send_queue[m_id].requiresAck = msg->requiresAck;
  }

  readyToDispatch(this->send_queue[m_id]);
  // Insert in the dispatch queue if requires ack or if not requires but have more than 1 chunks
  /*
   if (msg->requiresAck || (!msg->requiresAck && this->send_queue[m_id].nrChunks > 1))
   {
   readyToDispatch(this->send_queue[m_id]);
   }
   else
   {

   #ifdef DEBUG_MODE
   ROS_INFO("Is a small unreliable chunk, must publish now");
   #endif
   publishChunk(msg->header.vehicleId, this->send_queue[m_id].chunks[0].chunkData);
   this->send_queue.erase(m_id);
   }*/

}

void CommsRelay::sendAckMessage(ReliableMessage& m, const uint16_t& vid)
{
#ifdef DEBUG_MODE
  ROS_INFO("Send ACK to message chunk: %d vehicle %d", m.sequence, vid);
#endif

  RawData v;
  CommsUtils::serializeReliableMsg(m.messageId, &(v[0]), m.sequence, 0, v, RMT_ACK);
  publishChunk(vid, v);
}
/**
 * Check if the message is Complete
 * @param message
 */

void CommsRelay::processIfReceivedAll(MessageItem* message)
{
  uint32_t len = 0;
  if (message->control.size() == message->nrChunks)
  {
    seagull_communication_msgs::SeagullPayload payloadMsg;
    payloadMsg.header.vehicleId = message->destination;
    payloadMsg.length = 0;
    payloadMsg.data.clear();
    //! reserve space to receive data
    payloadMsg.data.reserve(message->nrChunks * CHUNK_MAX_SIZE);
    for (int sequence = 0; sequence < message->nrChunks; ++sequence)
    {
      payloadMsg.length += message->chunks[sequence].chunkData.size();
      payloadMsg.data.insert(payloadMsg.data.end(), message->chunks[sequence].chunkData.begin(),
                             message->chunks[sequence].chunkData.end());
    }
    payloadMsg.requiresAck = message->requiresAck;
    from_comms_relay_pub.publish(payloadMsg);

    ROS_INFO("Received all message %d in %lu seconds ",message->messageId, (CommsUtils::getTimestamp() - message->tsStart) / 1000);
  }
  else
  {
#ifdef DEBUG_MODE
    ROS_INFO("Received %lu of %d chunks", message->control.size(), message->nrChunks);
#endif

  }
}

/**
 *
 * @param m
 */
void CommsRelay::ackReceivedChunk(ReliableMessage& m, const uint16_t& source)
{

  arte::thread::ScopedLock(&this->lock_receive);
  if (received_queue.find(m.messageId) == received_queue.end())
  {
    //! This is the first chunk received
    received_queue[m.messageId].tsStart = CommsUtils::getTimestamp();
    received_queue[m.messageId].destination = source;
    received_queue[m.messageId].messageId = m.messageId;
    received_queue[m.messageId].nrChunks = CommsUtils::calculateNrOfChunks(m.length);
  }

  ChunkControl * chunk = NULL;
//REV This could be optimize because maybe i do not need to do this all the time
  received_queue[m.messageId].tsTick = CommsUtils::getTimestamp();

  chunk = &(received_queue[m.messageId].chunks[m.sequence]);
  if (chunk != NULL)
  {
    if (received_queue[m.messageId].chunks.find(m.sequence) == received_queue[m.messageId].chunks.end())
    {
      chunk->message = m.messageId;
    }
    chunk->chunkData = m.data;
    if (m.messageType == RMT_REQUIRES_ACK)
    {
#ifdef DEBUG_MODE

      {
        ROS_INFO("REceived a reliable chunk: %d ", m.sequence);
      }
#endif
      sendAckMessage(m, received_queue[m.messageId].destination);
    }

#ifdef DEBUG_MODE
    else
    {
      ROS_INFO("REceived a unreliable chunk: %d ", m.sequence);
    }
#endif
    received_queue[m.messageId].control.insert(m.sequence);

    processIfReceivedAll(&(received_queue[m.messageId]));
  }
  else
  {
    ROS_WARN("handleReceivedChunk: For some unknown reason the chunk is NULL");
  }
}

/**
 *
 * @param m
 */
void CommsRelay::processReceivedMessage(ReliableMessage& m, const uint16_t& source)
{

  if (m.messageType == RMT_REQUIRES_ACK || m.messageType == RMT_NO_ACK)
  {
    //! this is a requested message that needs a ack
    ackReceivedChunk(m, source);
  }else
  {
    arte::thread::ScopedLock(&this->lock_send);
    //! Some message needs an ACK
    if (this->send_queue.find(m.messageId) != this->send_queue.end())

    {
      //ROS_INFO("Received a Ack for chunk %d ", m.sequence);
      //! get the message chunk and mark as ack'ed
      send_queue[m.messageId].control.insert(m.sequence); // FIXME optimize the set of uint16_t
      send_queue[m.messageId].chunks[m.sequence].ackReceived = true;
      if (send_queue[m.messageId].control.size() == send_queue[m.messageId].nrChunks)
      {
        ROS_INFO("All message was sent in %lu seconds",
                 (CommsUtils::getTimestamp() - send_queue[m.messageId].tsStart) / 1000);

        this->send_queue.erase(m.messageId);
      }
    } //! else is a late response, the message already was discarded
  }
}

/**
 * Receive a message from AP and handle
 * according with protocol:
 *
 * @param msg received message
 */
void CommsRelay::fromAutopilotCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg)
{
//! Received data from piccolo payload stream
#ifdef DEBUG_MODE
//ROS_INFO("received data from AP: %d", msg->header.vehicleId);
#endif
  bool parsed = false;
  ReliableMessage m;
  for (int i = 0; i < msg->len; ++i)
  {
    parsed = parse(msg->data[i], m); //! splitted for debug purposes
    if (parsed)
    {
      processReceivedMessage(m, msg->header.vehicleId);
    }
#ifdef DEBUG_MODE
    else
    {
      // CommsUtils::print(msg->data);
      // ROS_INFO("Failed to parse message");
    }
#endif
  }
}
/**
 * Generate a next message id
 * @return
 */
uint16_t CommsRelay::nextMessageId()
{
  ++lastMessageId;
  return (this->lastMessageId %= USHRT_MAX);
}
/**
 * Parse function to handle the binary, reliable message
 * format
 * @param byte
 * @param msg
 * @return
 */
bool CommsRelay::parse(uint8_t byte, ReliableMessage& msg)
{
//
  bool rc = false;
  status.buffer.push_back(byte);
  switch (status.state)
  {
    case SOT1:
    {
      if (byte == RELIABLE_MSG_SOT1)
        status.state = SOT2;
      else
        resetParser();
      break;
    }
    case SOT2:
    {
      if (byte == RELIABLE_MSG_SOT2)
        status.state = MESSAGE_TYPE;
      else
        resetParser();
      break;
    }
    case MESSAGE_TYPE:
    {
      status.state = MESSAGE_ID;
      status.msg->messageType = byte;
      break;
    }
    case MESSAGE_ID:
    {
      if (status.buffer.size() == 5)
      {
        memcpy(&(status.msg->messageId), &(status.buffer[3]), sizeof(uint16_t));
        status.state = SEQUENCE;
      }
      break;
    }

    case SEQUENCE:
    {
      if (status.buffer.size() == 7)
      {
        memcpy(&(status.msg->sequence), &(status.buffer[5]), sizeof(uint16_t));
        status.msg->sequence = *(reinterpret_cast<uint16_t*>(&(status.buffer[5])));
        status.state = LENGTH;
      }
      break;
    }
    case LENGTH:
    {
      if (status.buffer.size() == RELIABLE_MSG_HDR_SIZE)
      {
        status.msg->data.clear();
        memcpy(&(status.msg->length), &(status.buffer[7]), sizeof(uint32_t));
        status.payloadSize = status.msg->length;
        //! Ack messages have a 0 length payload
        if (status.payloadSize > 0)
        {
          if (status.msg->messageType == RMT_REQUIRES_ACK)
          { //! this is a splited message each chunck have RELIABLE_MSG_MAX_SIZE maximum
            if (CHUNK_MAX_SIZE * (status.msg->sequence + 1) > status.msg->length)
            {
              status.payloadSize = status.msg->length % CHUNK_MAX_SIZE;
            }
            else
            {
              status.payloadSize = CHUNK_MAX_SIZE;
            }
          }
          status.state = DATA;
        }
        else
        {
          status.state = CRC;
        }
      }
      break;
    }
    case DATA:
    {
      if (status.buffer.size() == RELIABLE_MSG_HDR_SIZE + status.payloadSize)
      {
        status.msg->data.reserve(status.payloadSize);
        status.msg->data.assign(status.buffer.begin() + RELIABLE_MSG_HDR_SIZE, status.buffer.end());
        status.state = CRC;
      }
      else if (status.buffer.size() > RELIABLE_MSG_HDR_SIZE + status.payloadSize)
      {
        //! normally this never happen but
        resetParser();
      }
      break;
    }
    case CRC:
    {
      if (status.buffer.size() == RELIABLE_MSG_HDR_SIZE + status.payloadSize + RELIABLE_MSG_FTR_SIZE)
      {
        uint16_t crc = 0;

        status.crc = CommsUtils::CRC16(&(status.buffer[0]), RELIABLE_MSG_HDR_SIZE + status.payloadSize);

        memcpy(&crc, &(status.buffer[status.buffer.size() - RELIABLE_MSG_FTR_SIZE]), sizeof(uint16_t));
        if (status.crc == crc)
        {
          msg = *(status.msg);
          rc = true;
        }
        resetParser();
      }
      else if (status.buffer.size() > RELIABLE_MSG_HDR_SIZE + status.payloadSize + RELIABLE_MSG_FTR_SIZE)
      {
        resetParser();
      }
      break;
    }
    default:
      break;
  }
  return rc;
}

/**
 * Reset the parser status
 */
void CommsRelay::resetParser()
{
  try
  {

    status.state = SOT1;
    status.payloadSize = 0;
    status.buffer.clear();

    if (!status.msg)
      delete status.msg;
    //! FIXME Memory allocation
    status.msg = new ReliableMessage();
  }
  catch (std::bad_alloc& e)
  {
    ROS_ERROR("resetParser:: Failed to allocate memory: %s", e.what());
  }
}
/**
 * Timer function to check the sent messages validity. A message
 * must be discarded if a chunk lost validity or was not received
 * a ack for more than a threshold //! DOC put the formula here
 * @param event
 */
void CommsRelay::sendWatchdogTimerCallback(const ros::TimerEvent& event)
{

  arte::thread::ScopedLock(&this->lock_send);
  if (this->send_queue.size() > 0)
  {
    std::vector<uint16_t> to_delete; // list of deletion candidates
    //! iterate all sent messages
    for (MessageMap::iterator it_msgitem = send_queue.begin(); it_msgitem != send_queue.end(); ++it_msgitem)
    {
      uint64_t ts = CommsUtils::getTimestamp(); // current timestamp
      //! small trick to handle msgs that not require ack;
      bool marked4delete = !it_msgitem->second.requiresAck;

      //! iterate each chunk of the message
      for (ChunkMap::iterator it_chunk = it_msgitem->second.chunks.begin(); it_chunk != it_msgitem->second.chunks.end();
          ++it_chunk)
      {
        ChunkControl * chunk = &it_chunk->second;
        if (it_msgitem->second.requiresAck)
        {
          if (!chunk->ackReceived && chunk->sentTimestamp > 0) // is a not acked chunk
          {

            if (chunk->ackRetries < this->txRetries) //! if I can resend more times?
            {
              // elapsed time greater than the total timeout
              if ((ts - chunk->sentTimestamp) > ((this->ackTimeout) + (this->ackTimeout * chunk->ackRetries)))
              {
                chunk->ackRetries++; // try again
                chunk->sentTimestamp = 0; // will be sent again and goto the front of the queue
                dispatcher_queue.push(chunk);

#ifdef DEBUG_MODE
                uint16_t t;
                CommsUtils::deserializeType(&(chunk->chunkData[5]), t);
                ROS_INFO("Retry send chunk: %d", t);
#endif
              }
            }
            else
            {

              to_delete.push_back(it_msgitem->second.messageId);
              break;
            }
          }
        }
        else
        {
          //! if sent all can delete message, this ackreceived flag
          //! is marked by dispatcher
          marked4delete = marked4delete && chunk->ackReceived;
        }
      }
      if (marked4delete)
      {
        to_delete.push_back(it_msgitem->second.messageId);
      }
    }

    //! Delete all messages that was marked for deletion
    for (std::vector<uint16_t>::iterator it = to_delete.begin(); it != to_delete.end(); ++it)
    {
      ROS_WARN("Message expired %d",*it);
      this->send_queue.erase(*it);
    }
  }
}

/**
 * Timer function to check received messages validity
 * We must discard messages that does not have received a chunk for more
 * than a threshold time
 * @param event
 */
void CommsRelay::receiveWatchdogTimerCallback(const ros::TimerEvent& event)
{
  arte::thread::ScopedLock(&this->lock_receive);

  if (this->received_queue.size() > 0)
  {
    std::vector<uint16_t> to_delete;
    to_delete.clear();
    for (MessageMap::iterator it_msgitem = received_queue.begin(); it_msgitem != received_queue.end(); ++it_msgitem)
    {
      uint64_t ts = CommsUtils::getTimestamp();
      MessageItem *m = &(it_msgitem->second);
      uint16_t ack_count = 0;
      if (m->tsTick > 0)
      {
        if ((ts - m->tsTick) > (this->txRetries * this->ackTimeout))
        {
          to_delete.push_back(m->messageId);
          break;
        }
      }
    }

    //! Delete all messages that was marked for deletion
    for (std::vector<uint16_t>::iterator it = to_delete.begin(); it != to_delete.end(); ++it)
    {
      ROS_WARN("Drop received message: %d", *it);
      this->received_queue.erase(*it);
    }
  }
}
/**
 * Receive parameters for communication setting
 * @param msg
 */
void CommsRelay::commsParametersCallback(const seagull_commons_msgs::CommsParameters::ConstPtr& msg)
{

  if (msg->timeout >= 0)
    this->ackTimeout = msg->timeout;
  if (msg->retries >= 0)
    this->txRetries = msg->retries;
  if (msg->dispatch_rate >= 0)
    this->dispatch_rate = msg->dispatch_rate;

  ROS_INFO("New comms parameters received: timeout (%d) retries(%d) dispatch_rate(%d)", this->ackTimeout, (int )this->txRetries,this->dispatch_rate);
}

