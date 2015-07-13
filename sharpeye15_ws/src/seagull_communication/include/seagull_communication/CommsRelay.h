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
// Description: CommsRelay.h
// ==========================================================================

#ifndef COMMSRELAY_H_
#define COMMSRELAY_H_
//! STD Headers
#include <stdint.h>
#include <string>
//! ROS Headers
#include <ros/publisher.h>
#include <ros/subscriber.h>
//! Commons library Headers
#include <seagull_commons/ROSNode.h>
#include <arte/thread/TSQueue.h>
#include <seagull_communication_msgs/SeagullPayload.h>
#include <seagull_autopilot_msgs/AutopilotPayload.h>
#include <seagull_commons_msgs/CommsParameters.h>
//!
#include <seagull_communication/CommsDefinitions.h>
#include <seagull_communication/CommsUtils.h>

#include <pthread.h>
#include <arte/thread/ScopedLock.h>
#include <stdexcept>
#include <seagull_commons/Heartbeater.h>
#define DEBUG_MODE 1

//! Comms relay main class
class CommsRelay : public ROSNode
{
public:
  CommsRelay();
  virtual ~CommsRelay();
  //!- Implements the super class abstract methods
  virtual void
  setup();
  virtual void
  loop();

  //! Execute a parser step and return a msg if applicable
  bool parse(uint8_t byte, ReliableMessage& msg);
  //! Send a ack message
  void sendAckMessage(ReliableMessage& m, const uint16_t& vid);
  //!
  void processIfReceivedAll(MessageItem* message);
  void readyToDispatch(MessageItem& message);

private:

  //! Initiate Subscribers
  void setupSubscribers();
  //! Initiate Publishers
  void setupPublishers();
  //! Callback to receive data to be processed by commsRelay forwarded by SM
  void toCommsRelayCallback(const seagull_communication_msgs::SeagullPayload::ConstPtr& msg);
  //! Callback to receive data to be processed by commsRelay forwarded by AP
  void fromAutopilotCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg);
  //!
  void commsParametersCallback(const seagull_commons_msgs::CommsParameters::ConstPtr& msg);
  //! Helper funcion to generate a unique messageId
  uint16_t nextMessageId();

  //! Creates a raw serialization of a reliable message
  void createRawReliableMessage(const uint16_t& id, const std::vector<uint8_t>& data, int index, RawData& m,
                                uint8_t type = RMT_REQUIRES_ACK);
  //!
  void processReceivedMessage(ReliableMessage& m, const uint16_t& source);
  //!
  void ackReceivedChunk(ReliableMessage& m, const uint16_t& source);

  //! Execute a parser step and return a msg if applicable
  //  bool parse(uint8_t byte, ReliableMessage& msg);
  //! Reset Message Parser
  void resetParser();
  //! Publish a chunk of data
  void publishChunk(const uint16_t& dst, const RawData& data);

  //! Callback to the timer that search for sent messages status
  void sendWatchdogTimerCallback(const ros::TimerEvent& event);
  //! Callback to the timer that search for received messages status
  void receiveWatchdogTimerCallback(const ros::TimerEvent& event);
  //!
  void dispatchWatchdogTimerCallback(const ros::TimerEvent& event);
  //! Get a valid chunk from dispacth queue,
  //!  the dispacth queue is disconnected from the send queue
  //!  we must check if the chunk belongs to an existing message
  ChunkControl* popValidChunk(bool & requires_ack, uint16_t& destination);
  /**
   * Class attributes
   */
  pthread_mutex_t lock_send;
  pthread_mutex_t lock_receive;

  //!- ROS Subscribers
  ros::Subscriber to_comms_relay_sub;
  ros::Subscriber from_autopilot_sub;
  ros::Subscriber comms_parameters_sub;
  //!- ROS Publishers
  ros::Publisher from_comms_relay_pub;
  ros::Publisher to_autopilot_pub;

  //!
  MessageMap send_queue;
  //!
  MessageMap received_queue;
  //!
  // arte::thread::TSQueue<ChunkControl*> dispatcher_queue;
  DispatchQueue dispatcher_queue;

  //! Member variables
  //! This will used to generate internal unique messages ids
  uint16_t lastMessageId;

  //! The messageItem parser status
  CommsParserStatus status;
  //!
  ros::Timer sendWatchdogTimer;
  //!
  ros::Timer receivedWatchdogTimer;
  //!
  ros::Timer dispatchWatchdogTimer;
  //DOC Document the new message CommsParameters
  //! Miliseconds of timeout to check for a ack timeout
  uint16_t ackTimeout;
  //! Number of tentatives to send a chunk
  uint8_t txRetries;
  //! dispatch rate in hz
  uint16_t dispatch_rate;
  Heartbeater * heartbeat;
  static const int HEARTBEAT_INTERVAL_MS = 2000;
};

#endif /* COMMSRELAY_H_ */

