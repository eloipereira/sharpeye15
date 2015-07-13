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
// Description: test_CommsRelay.cpp
//
// ==========================================================================
#include <vector>
#include <map>
#include <string>
#include <errno.h>
#include <iostream>
#include <fstream>
#include <stdlib.h>
//!
#include <boost/smart_ptr/shared_ptr.hpp>
#include <gtest/gtest.h>
#include <gtest/gtest-message.h>
#include <gtest/internal/gtest-internal.h>
//!
#include <ros/init.h>
#include <ros/node_handle.h>
#include <ros/rate.h>
#include <ros/ros.h>
#include <ros/subscriber.h>
//!
#include <seagull_communication/CommsRelay.h>
#include <seagull_communication/CommsUtils.h>
#include <seagull_communication/CommsDefinitions.h>
//! Messages
#include <seagull_commons_msgs/SeagullPayload.h>
#include <seagull_autopilot_msgs/AutopilotPayload.h>
//! Topics
#include <seagull_autopilot/TopicsAndServices.h>
#include <seagull_communication/TopicsAndServices.h>
//!
#include <gtest/gtest.h>

#define FRAME_SIZE_640_480 (307200)
#define FRAME_SIZE_640_480_RGB (FRAME_SIZE_640_480 * 3)
//!
typedef std::map<uint16_t, RawData> ImageMap_t;

//! Global Variables

seagull_autopilot_msgs::AutopilotPayload gAutopilotPayload;
ImageMap_t imageMap;
bool gReceivedAutopilotPayload = false;
bool bParsed = false;
int iAckCount = 0;
ros::Publisher pubFromAPPayload;

class CommsRelayTest : public testing::Test
{

public:

  CommsRelayTest()
  {
    srand(time(NULL));
    rate = new ros::Rate(10.0);

    picture.clear();

    // pubToCommsPayload = node.advertise<seagull_commons_msgs::SeagullPayload>( seagull_communication::topics::TO_COMMS_RELAY_TOPIC, 1000);
    // pubFromAPPayload = node.advertise<seagull_autopilot_msgs::AutopilotPayload>(        seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 1000);
    // subToAPPayload = node.subscribe(seagull_autopilot::topics::AP_TO_PAYLOAD_TOPIC, 1000,                                    &CommsRelayTest::ToAutopilotPayloadCallback, this);
    subFromCommsRealayPayload = node.subscribe(seagull_communication::topics::FROM_COMMS_RELAY_TOPIC, 1000,
                                               &CommsRelayTest::FromCommsRelayPayloadCallback, this);

    // subFromAPPayload = node.subscribe(seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 1000,                                      &CommsRelayTest::FromAutopilotPayloadCallback, this);

    std::string file = "seagull_communication/test/image_640_480-bw.jpg";
    if (ws_exist_file(file))
    {
      try
      {

        std::fstream image;
        image.open(file.c_str(), std::ios_base::binary | std::ios_base::in);
        if (image.is_open())
        {
          if (!image.eof())
          {
            image.seekg(0, std::ios_base::end);
            std::streampos fileSize = image.tellg();
            picture.resize(fileSize);
            image.seekg(0, std::ios_base::beg);
            image.read(reinterpret_cast<char*>(&(picture[0])), fileSize);
          }
          else
          {
            std::cout << strerror(errno) << '\n';
          }
        }
      }
      catch (std::ios_base::failure& e)
      {
        std::cout << "Fail to open image: " << e.what() << "\n";
      }
    }
    else
    {
      gen_random(picture, FRAME_SIZE_640_480 / 3);

    }
    std::cout << "Size of generated data size: " << picture.size() << "\n";

  }

protected:
  ros::Subscriber subToAPPayload;
  ros::Subscriber subFromCommsRealayPayload;
  ros::Publisher pubToCommsPayload;
  ros::Subscriber subFromAPPayload;
  std::vector<uint8_t> picture;
  ros::NodeHandle node;
  ros::Rate *rate;

  /**
   *
   */
  virtual void SetUp()
  {

    bParsed = false;
    iAckCount = 0;
    imageMap.clear();

  }
  /**
   *
   * @return
   */
  uint8_t fail()
  {
    return 1 + (rand() % 100);
  }

  /**
   *
   */
  virtual void TearDown()
  {
    node.shutdown();
    delete rate;
  }

  void FromCommsRelayPayloadCallback(const seagull_commons_msgs::SeagullPayload::ConstPtr& msg)
  {
    if (msg->requiresAck)
    {
      this->saveImage("FromCommsRelayPayloadImageOnGroundFromBoard.jpg", reinterpret_cast<const char*>(&(msg->data[0])),
                      msg->data.size());
      std::cout << "Received all image... saving to disk\n";
      gReceivedAutopilotPayload = true;
    }
    else
    {

      std::cout << "Received unreliable size: " << msg->data.size();
    }

  }
  void FromAutopilotPayloadCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg)
  {
    std::cout << "Received chunk\n";
  }
  /**
   *
   * @param msg
   */
  void ToAutopilotPayloadCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg)
  {
    gAutopilotPayload = *msg;
    CommsRelay node;
    ReliableMessage rm;
    for (int i = 0; i < msg->data.size(); ++i)
    {
      bParsed = node.parse(msg->data[i], rm);
    }
    if (bParsed)
    {
      if (rm.messageType == RMT_ACK)
      {
        iAckCount++;
      }
      else if (rm.messageType == RMT_NO_ACK)
      {

        imageMap[rm.sequence].assign(rm.data.begin(), rm.data.end());
        iAckCount++;
      }
      else if (rm.messageType == RMT_REQUIRES_ACK)
      {

        if (fail() < 100)
        {
          RawData v;
          CommsUtils::serializeReliableMsg(rm.messageId, &(v[0]), rm.sequence, 0, v, RMT_ACK);
          seagull_autopilot_msgs::AutopilotPayload ap_payload;
          ap_payload.header.vehicleId = 1; // TODO review destination
          ap_payload.len = v.size();
          ap_payload.data.assign(v.begin(), v.end());
          pubFromAPPayload.publish(ap_payload);
          imageMap[rm.sequence].assign(rm.data.begin(), rm.data.end());
          iAckCount++;
        }
      }
    }
    else
    {

      std::cout << "Failed to parse!\n";
      CommsUtils::print(msg->data);
    }
    gReceivedAutopilotPayload = true;

  }
  /**
   * Save a image from a full byte array
   * @param name
   * @param data
   */
  void saveImage(const std::string& name, const char* data, size_t sz)
  {

    std::fstream image;
    image.open(name.c_str(), std::ios_base::binary | std::ios_base::out);
    if (image.is_open())
    {
      image.write(data, sz);
      image.flush();
      image.close();
    }

  }

  /**
   *
   * @param name
   * @param map
   */
  void saveImage(const std::string& name, ImageMap_t& map)
  {
    std::cout << "Number of chunks of the image:" << map.size() << "\n";
    std::fstream image;
    image.open(name.c_str(), std::ios_base::binary | std::ios_base::out);
    if (image.is_open())
    {
      for (uint16_t i = 0; i < map.size(); ++i)
      {
        if (map.find(i) == map.end())
        {
          std::cout << "Missing chunk :" << i << "\n\n\n\n\n\n\n";
        }
        else
        {
          RawData *v = &(map[i]);
          image.write(reinterpret_cast<char *>(&((*v)[0])), (*v).size());
          image.flush();
        }
      }
      image.flush();
      image.close();
    }

  }
  /**
   *
   * @param subscriber
   * @param r
   */
  void wait4Publishers(ros::Subscriber& subscriber)
  {
    while (subscriber.getNumPublishers() == 0)
    {
      rate->sleep();
    }

  }
  /**
   *
   * @param publisher
   * @param r
   */
  void wait4Subscribers(ros::Publisher& publisher)
  {
    while (publisher.getNumSubscribers() == 0)
    {
      rate->sleep();
    }
  }

  void TestReceiveSeagull(bool reliable)
  {

    wait4Publishers(subToAPPayload);
    wait4Subscribers(pubToCommsPayload);

    seagull_commons_msgs::SeagullPayload m;
    m.header.vehicleId = 1;
    m.requiresAck = reliable;
    m.data.assign(picture.begin(), picture.end());
    m.lenght = m.data.size();
    sleep(2);
    pubToCommsPayload.publish(m);
  }

  /**
   *
   * @param s
   * @param delim
   * @param elems
   * @return
   */
  std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems)
  {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim))
    {
      elems.push_back(item);
    }
    return elems;
  }

  bool fexists(const std::string & path)
  {
    std::ifstream f(path.c_str());
    if (f.good())
    {
      f.close();
      return true;
    }
    else
    {
      f.close();
      return false;
    }
  }
  bool ws_exist_file(std::string& path)
  {
    char* pPath;
    pPath = getenv("ROS_PACKAGE_PATH");
    if (pPath != NULL)
    {
      std::vector<std::string> paths;
      std::string str(pPath);
      split(str, ':', paths);
      for (int i = 0; i < paths.size(); ++i)
      {

        std::string fullPath = paths[i] + "/" + path;
        if (fexists(fullPath))
        {
          path.clear();
          path = fullPath;
          return true;
        }
      }
    }
    return false;
  }
  void gen_random(std::vector<uint8_t>& data, const uint32_t len)
  {
    static const char alphanum[] = "0123456789"
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "abcdefghijklmnopqrstuvwxyz";

    for (int i = 0; i < len; ++i)
    {
      data.push_back(alphanum[rand() % (sizeof(alphanum) - 1)]);
    }

    data[len] = 0;
  }

};

TEST_F(CommsRelayTest, testGroundStationReceiveImage)
{
  gReceivedAutopilotPayload = false;
  wait4Publishers(subFromCommsRealayPayload);
  std::cout << "Starting callbacks!\n";
  while (!gReceivedAutopilotPayload)
  {
    ros::spinOnce();
    rate->sleep();
  }

  std::cout << "Node Exiting!\n";
}
// Run all the tests that were declared with TEST()
int main(int argc, char **argv)
{
  ros::M_string m;
  m["__master"] = "http://localhost:11322";
  ros::init(m, "test_CommsRelayG");

  testing::InitGoogleTest(&argc, argv);

  return RUN_ALL_TESTS();
}
