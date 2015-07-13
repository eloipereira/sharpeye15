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
// Date:    Apr 3, 2014
// Author: Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: CommsUtils.h
//
// ==========================================================================

#ifndef COMMSUTILS_H_
#define COMMSUTILS_H_

#include <seagull_communication/CommsDefinitions.h>
#include <stdint.h>
#include <sys/time.h>
#include <cstddef>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

const static int crc_table[256] = {0X0000, 0XC0C1, 0XC181, 0X0140, 0XC301, 0X03C0, 0X0280, 0XC241, 0XC601, 0X06C0,
                                   0X0780, 0XC741, 0X0500, 0XC5C1, 0XC481, 0X0440, 0XCC01, 0X0CC0, 0X0D80, 0XCD41,
                                   0X0F00, 0XCFC1, 0XCE81, 0X0E40, 0X0A00, 0XCAC1, 0XCB81, 0X0B40, 0XC901, 0X09C0,
                                   0X0880, 0XC841, 0XD801, 0X18C0, 0X1980, 0XD941, 0X1B00, 0XDBC1, 0XDA81, 0X1A40,
                                   0X1E00, 0XDEC1, 0XDF81, 0X1F40, 0XDD01, 0X1DC0, 0X1C80, 0XDC41, 0X1400, 0XD4C1,
                                   0XD581, 0X1540, 0XD701, 0X17C0, 0X1680, 0XD641, 0XD201, 0X12C0, 0X1380, 0XD341,
                                   0X1100, 0XD1C1, 0XD081, 0X1040, 0XF001, 0X30C0, 0X3180, 0XF141, 0X3300, 0XF3C1,
                                   0XF281, 0X3240, 0X3600, 0XF6C1, 0XF781, 0X3740, 0XF501, 0X35C0, 0X3480, 0XF441,
                                   0X3C00, 0XFCC1, 0XFD81, 0X3D40, 0XFF01, 0X3FC0, 0X3E80, 0XFE41, 0XFA01, 0X3AC0,
                                   0X3B80, 0XFB41, 0X3900, 0XF9C1, 0XF881, 0X3840, 0X2800, 0XE8C1, 0XE981, 0X2940,
                                   0XEB01, 0X2BC0, 0X2A80, 0XEA41, 0XEE01, 0X2EC0, 0X2F80, 0XEF41, 0X2D00, 0XEDC1,
                                   0XEC81, 0X2C40, 0XE401, 0X24C0, 0X2580, 0XE541, 0X2700, 0XE7C1, 0XE681, 0X2640,
                                   0X2200, 0XE2C1, 0XE381, 0X2340, 0XE101, 0X21C0, 0X2080, 0XE041, 0XA001, 0X60C0,
                                   0X6180, 0XA141, 0X6300, 0XA3C1, 0XA281, 0X6240, 0X6600, 0XA6C1, 0XA781, 0X6740,
                                   0XA501, 0X65C0, 0X6480, 0XA441, 0X6C00, 0XACC1, 0XAD81, 0X6D40, 0XAF01, 0X6FC0,
                                   0X6E80, 0XAE41, 0XAA01, 0X6AC0, 0X6B80, 0XAB41, 0X6900, 0XA9C1, 0XA881, 0X6840,
                                   0X7800, 0XB8C1, 0XB981, 0X7940, 0XBB01, 0X7BC0, 0X7A80, 0XBA41, 0XBE01, 0X7EC0,
                                   0X7F80, 0XBF41, 0X7D00, 0XBDC1, 0XBC81, 0X7C40, 0XB401, 0X74C0, 0X7580, 0XB541,
                                   0X7700, 0XB7C1, 0XB681, 0X7640, 0X7200, 0XB2C1, 0XB381, 0X7340, 0XB101, 0X71C0,
                                   0X7080, 0XB041, 0X5000, 0X90C1, 0X9181, 0X5140, 0X9301, 0X53C0, 0X5280, 0X9241,
                                   0X9601, 0X56C0, 0X5780, 0X9741, 0X5500, 0X95C1, 0X9481, 0X5440, 0X9C01, 0X5CC0,
                                   0X5D80, 0X9D41, 0X5F00, 0X9FC1, 0X9E81, 0X5E40, 0X5A00, 0X9AC1, 0X9B81, 0X5B40,
                                   0X9901, 0X59C0, 0X5880, 0X9841, 0X8801, 0X48C0, 0X4980, 0X8941, 0X4B00, 0X8BC1,
                                   0X8A81, 0X4A40, 0X4E00, 0X8EC1, 0X8F81, 0X4F40, 0X8D01, 0X4DC0, 0X4C80, 0X8C41,
                                   0X4400, 0X84C1, 0X8581, 0X4540, 0X8701, 0X47C0, 0X4680, 0X8641, 0X8201, 0X42C0,
                                   0X4380, 0X8341, 0X4100, 0X81C1, 0X8081, 0X4040};

/**
 *
 */
class CommsUtils
{
public:

  /**
   *
   * @param data
   * @param size
   * @return
   */
  inline static uint16_t CRC16(uint8_t *data, size_t size)
  {
    uint16_t remainder = 0;
    return accumulatesCRC16(remainder, data, size);

  }

  /**
   *
   * @param byte
   * @return
   */
  static inline uint16_t CRC16(uint8_t byte)
  {
    uint16_t remainder = 0;
    return (remainder >> 8) ^ crc_table[(remainder ^ byte) & 0xff];
  }

  /**
   *
   * @param crc
   * @param byte
   * @return
   */
  static inline uint16_t accumulatesCRC16(const uint16_t& crc, uint8_t byte)
  {
    uint16_t remainder = crc;
    return (remainder >> 8) ^ crc_table[(remainder ^ byte) & 0xff];
  }

  /**
   *
   * @param crc
   * @param data
   * @param size
   * @return
   */
  static inline uint16_t accumulatesCRC16(const uint16_t& crc, uint8_t *data, size_t size)
  {
    uint16_t remainder = crc;
    while (size--)
      remainder = (remainder >> 8) ^ crc_table[(remainder ^ *data++) & 0xff];
    return remainder;

  }
  /**
   *
   * @param data
   * @param buffer
   * @return
   */
  template<typename T>
  inline size_t static deserializeType(const uint8_t *buffer, T& value)
  {
    size_t sz = sizeof(T);

    //uint8_t * v = reinterpret_cast<uint8_t*> (&value);
    memcpy(&value, buffer, sz);
    return sz;

  }
  /**
   *
   * @param data
   * @param buffer
   * @return
   */
  template<typename T>
  inline size_t static serializeType(uint8_t *buffer, const T& value)
  {
    size_t sz = sizeof(T);
    //uint8_t * v = reinterpret_cast<uint8_t*> (&value);
    memcpy(buffer, &value, sz);
    return sz;

  }
  /**
   *
   * @param buffer
   * @param vector
   * @return
   */
  template<typename T>
  inline size_t static serializeVector(uint8_t *buffer, const std::vector<T>& vector)
  {
    size_t sz = vector.size() * sizeof(T);
    T* v = &vector[0];
    memcpy(buffer, v, sz);
    return sz;
  }
  /**
   *
   * @param buffer
   * @param value
   * @param sz
   * @return
   */
  template<typename T>
  inline size_t static serializeVector(uint8_t *buffer, const T* value, const size_t& sz)
  {
    size_t s = sz * sizeof(T);
    const uint8_t * v = reinterpret_cast<const uint8_t*>(value);
    memcpy(buffer, v, s);
    return s;
  }
  /**
   *
   * @param id
   * @param data
   * @param sequence
   * @param length
   * @return
   */
  inline static void serializeReliableMsg(const uint16_t& id, const uint8_t* data, uint16_t sequence, uint32_t length,
                                          RawData& m, uint8_t type)
  {

    //! calculate payload size in case of splited message
    uint32_t payload_size = length;

    if (CHUNK_MAX_SIZE * (sequence + 1) > payload_size)
    {
      payload_size = payload_size % CHUNK_MAX_SIZE;
    }
    else
    {
      payload_size = CHUNK_MAX_SIZE;
    }

    //! allocate space
    m.clear();
    m.resize(RELIABLE_MSG_HDR_SIZE + RELIABLE_MSG_FTR_SIZE + payload_size);

    uint8_t* head = &(m[0]);
    uint8_t* tail = head;

    tail += CommsUtils::serializeType(tail, RELIABLE_MSG_SOT1);
    tail += CommsUtils::serializeType(tail, RELIABLE_MSG_SOT2);
    tail += CommsUtils::serializeType(tail, (unsigned char)type);
    tail += CommsUtils::serializeType(tail, id);
    tail += CommsUtils::serializeType(tail, sequence);
    tail += CommsUtils::serializeType(tail, length);
    tail += CommsUtils::serializeVector(tail, data, payload_size);
    uint16_t crc16 = CommsUtils::CRC16(head, tail - head);
    tail += CommsUtils::serializeType(tail, crc16);
  }
  /**
   *
   * @param data
   * @return
   */
  static inline std::string toString(const std::vector<uint8_t> &data)
  {
    std::stringstream sstream;

    sstream << std::internal << std::setfill('0');
    sstream << "[" << data.size() << "]";
    for (unsigned int i = 0; i < data.size(); ++i)
    {
      sstream << std::hex << std::setw(2) << (int)data[i];
    }
    return sstream.str();
  }
  /**
   *
   * @param data
   * @param size
   * @return
   */
  static inline std::string toString(const unsigned char* data, size_t size)
  {
    std::stringstream sstream;

    sstream << std::internal << std::setfill('0');
    sstream << "[" << size << "]";
    for (unsigned int i = 0; i < size; ++i)
    {
      sstream << std::hex << std::setw(2) << (int)data[i];
    }
    return sstream.str();
  }
  /**
   *
   * @param data
   * @param size
   */
  static inline void print(const unsigned char* data, size_t size)
  {
    std::cout << toString(data, size) << std::endl;
  }
  /**
   *
   * @param data
   */
  static inline void print(const std::vector<uint8_t> &data)
  {
    std::cout << toString(data) << std::endl;
  }

  /**
   * Gets the unix time stamp in miliseconds
   * @return
   */
  static inline uint64_t getTimestamp()
  {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    uint64_t t = tv.tv_sec * (uint64_t)1000000 + tv.tv_usec;
    t /= 1000;
    return t;
  }

  /**
   * Returns the number of chunks of a fragmented message based on message lenght
   * @param msg
   * @return
   */
  static inline uint32_t calculateNrOfChunks(const uint32_t& lenght)
  {
    return lenght / CHUNK_MAX_SIZE + (lenght % CHUNK_MAX_SIZE == 0 ? 0 : 1);
  }

};

#endif /* COMMSUTILS_H_ */

