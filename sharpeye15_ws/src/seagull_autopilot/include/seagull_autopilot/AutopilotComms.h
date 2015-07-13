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
// Project: seagull_autopilot
// Date:    2014/02/17
// Author:  Pedro Marques da Silva  
// -------------------------------------------------------------------------=
// Description: AutopilotComms.h
// ==========================================================================

#ifndef AUTOPILOTCOMMS_H_
#define AUTOPILOTCOMMS_H_
//! STD Headers
#include <stdint.h>
#include <string>
//! ROS Headers
#include <ros/publisher.h>
#include <ros/subscriber.h>
//! Commons library Headers
#include <seagull_commons/ROSNode.h>

#include <arte/io/SerialPort.h>
#include <arte/io/IOMultiplexer.h>

//! Custom messages
#include <seagull_autopilot_msgs/AutopilotPayload.h>
#include <seagull_autopilot/TopicsAndServices.h>
#include <seagull_commons/Heartbeater.h>

const static std::string PS_BAUDRATE_PARAM = "ps_baudrate";
const static std::string PS_DEVICE_PARAM = "ps_device";
const static std::string PS_VEHICLEID_PARAM = "ps_vehicleid";
const static uint32_t PS_BAUDRATE_PARAM_DEFAULT = 57600;
const static std::string PS_DEVICE_PARAM_DEFAULT = "/dev/ttyS0";
/*!
 * This is a ros node class
 *
 */
class AutopilotComms : public ROSNode
{
public:
  AutopilotComms();
  virtual ~AutopilotComms();
  //!- Implements the super class abstract methods
  virtual void
  setup();
  virtual void
  loop();

private:

  //!- ROS Subscribers
  ros::Publisher from_payload_pub;

  //!- ROS Publishers
  ros::Subscriber to_payload_sub;

  //! Initiate Subscribers
  void setupSubscribers();

  //! Initiate Publishers
  void setupPublishers();

  //! Callbacks
  void toPayloadCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg);

  void setupParameters();
  void publishFromPayload(uint32_t len, uint8_t buffer[256]);

  //! Member atributes
  std::string uart_device_param;
  int uart_baudrate_param;
  int vehicle_id_param;
  //! Serial port device handler
  arte::io::SerialPort *uart;
  arte::io::IOMultiplexer iomux;
  Heartbeater * heartbeat;
  static const int HEARTBEAT_INTERVAL_MS = 2000;
  static const int BUFFER_LEN = 256;
};

#endif /* AUTOPILOTCOMMS_H_ */

