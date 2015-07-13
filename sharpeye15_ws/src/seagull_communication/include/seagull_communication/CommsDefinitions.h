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
// Project: seagull_communication-Debug@seagull_communication
// Date:    Apr 1, 2014
// Author: Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: CommsDefinitions.h
//
// ==========================================================================

#ifndef COMMSDEFINITIONS_H_
#define COMMSDEFINITIONS_H_
#include <string.h>
#include <vector>
#include <map>
#include <queue>
#include <iostream>
#include <functional>

//! Reliable message Start Of Trasmission symbol
static const uint8_t RELIABLE_MSG_SOT1 = 0xab;
static const uint8_t RELIABLE_MSG_SOT2 = 0xcd;
static const uint16_t RELIABLE_MSG_SOT = (RELIABLE_MSG_SOT1 << 8) | RELIABLE_MSG_SOT2;

//! Max size of a full reliable message, in this case is the max size of the
//!   Piccolo PayladStream Packet data payload
static const uint16_t RELIABLE_MSG_MAX_SIZE = 255;
//! Max size of the reliable message header(bytes)
static const uint16_t RELIABLE_MSG_HDR_SIZE = 11;
//! Max size of the reliable message footer(bytes)
static const uint16_t RELIABLE_MSG_FTR_SIZE = 2;
//! Max size of each chunk of a fragmented message(bytes)
static const uint16_t CHUNK_MAX_SIZE = RELIABLE_MSG_MAX_SIZE - RELIABLE_MSG_HDR_SIZE - RELIABLE_MSG_FTR_SIZE;
//! Ack timeout (milliseconds)
static const uint16_t ACK_TIMEOUT = 6000;
//! Default value for dispatch rate
static const uint16_t DEFAULT_DISPATCH_RATE = 5;
//! Max number of retries when transmission failed
static const uint8_t MAX_TX_RETRIES = 5;
//! Sequence Number to a set in a NO_ACK type chunk
static const uint16_t NO_ACK_CHUNK_SEQUENCE = 0;

//! Definition of states for the FSM
enum CommsRelayParserState
{
  SOT1, SOT2, MESSAGE_TYPE, MESSAGE_ID, SEQUENCE, LENGTH, DATA, CRC
};

//! Definition of the types of reliable messages
enum ReliableMessageTypeEnum
{
  RMT_REQUIRES_ACK = 0, //< The message is reliable and requires ACK
  RMT_ACK = 1, //< The message is a ACK to a previous one
  RMT_NO_ACK = 2 //< The message does not requires a ACK
};

//! Forward declaration

struct ChunkControl_t;
struct MessageItem_t;
struct ReliableMessage_t;
//! Forward typedef definition

typedef ChunkControl_t ChunkControl;
typedef MessageItem_t MessageItem;
typedef ReliableMessage_t ReliableMessage;
//! Map for message items
typedef std::map<uint16_t, MessageItem> MessageMap;
//! Definition of a chunck map indexed by sequence id
typedef std::map<uint16_t, ChunkControl> ChunkMap;
//! Expressive type for raw data
typedef std::vector<uint8_t> RawData;

//! Definition of a reliable message
//!  ---------------------------------
//! |ab.cd| | . | . | . . . | ... | . |
//!  ---------------------------------
//!    2   1  2   2     4     n     2
//!  ---------------------------------
//
struct ReliableMessage_t
{
  uint8_t messageType; //< (02)Message type 0-RequiresAck,1-Ack,2-NoAck (ReliableMessageTypeEnum)
  uint16_t messageId; //< (03)Message unique id
  uint16_t sequence; //< (05)Sequence Number usefull to fragmented messages
  uint32_t length; //< (07)Size of the data on the message //TODO > Update docs
  std::vector<uint8_t> data; //< (11)Message payload
};

//! Definition of the control structure of each chunk
struct ChunkControl_t
{
  uint64_t sentTimestamp; //< Timestamp field to since last transmission
  uint8_t ackRetries; //< Number of tries for this chunk
  RawData chunkData; //< Reliable Message packet to send/resend
  uint16_t message; //< Pointer to the message data
  bool ackReceived; //< Controls if a ACK was received

};

//! Definition of the receive and send queue item
struct MessageItem_t
{
  uint16_t messageId; //< Message unique id
  uint64_t tsTick; //< Last chunk action received
  uint64_t tsStart; //< Last chunk action received //! FIXME Remove for release
  uint16_t destination; //< Destination of the message
  uint16_t nrChunks; //< Number of chunks
  ChunkMap chunks; //< Reliable Message packet to send/resend
  std::set<uint16_t> control; //< Controls what chunks were received
  bool requiresAck; //< Enables to check if this message requires ack
};
//! Structure to support reliableMessage Parser
//! tipo ReliableMessage
typedef struct CommsParserStatus_t
{
  RawData buffer;
  CommsRelayParserState state;
  uint16_t crc;
  ReliableMessage *msg;
  uint32_t payloadSize;

} CommsParserStatus;
//! Definition of a messageitem map indexed by message id

// REV test this implementation a priority queue implementation
struct CompareChunkTimeStamp : public std::binary_function<ChunkControl *, ChunkControl *, bool>
{
  bool operator()(const ChunkControl *x, const ChunkControl *y) const
  {

    return x->sentTimestamp <= y->sentTimestamp;
  }
};

typedef std::priority_queue<ChunkControl*, std::vector<ChunkControl*>, CompareChunkTimeStamp> DispatchQueue;

#endif /* COMMSDEFINITIONS_H_ */

