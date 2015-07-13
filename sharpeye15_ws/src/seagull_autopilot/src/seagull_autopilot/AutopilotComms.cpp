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
// Description: AutopilotComms.cpp
//
// ==========================================================================

#include <seagull_autopilot/AutopilotComms.h>

#include <ros/console.h>
#include <ros/node_handle.h>
#include <rosconsole/macros_generated.h>
#include <stdexcept>
#include <vector>
#include <seagull_commons_msgs/SeagullHeartbeat.h>
#include <seagull_commons/TopicsAndServices.h>

/**
 * Class constructor
 */
AutopilotComms::AutopilotComms() :
    ROSNode(true), vehicle_id_param(0),heartbeat(0)
{
  this->uart_device_param = PS_DEVICE_PARAM_DEFAULT;
  this->uart_baudrate_param = PS_BAUDRATE_PARAM_DEFAULT;
  this->uart = new arte::io::SerialPort();
}
/**
 * Class destructor. release resources
 */
AutopilotComms::~AutopilotComms()
{
  delete heartbeat;
  delete this->uart;
}

void AutopilotComms::setupParameters()
{
  readParam(PS_BAUDRATE_PARAM, this->uart_baudrate_param, this->uart_baudrate_param);
  readParam(PS_DEVICE_PARAM, this->uart_device_param, this->uart_device_param);
  if (!readParam(PS_VEHICLEID_PARAM, this->vehicle_id_param, this->vehicle_id_param))
    throw std::runtime_error("Missing required vehicle_id");
}

/**
 * Setup the node
 */
void AutopilotComms::setup()
{
  setupParameters();
  setupSubscribers();
  setupPublishers();

  if (this->uart->connect(this->uart_device_param, this->uart_baudrate_param))
  {
    ROS_INFO("Connected to %s with baudrate=%d", this->uart_device_param.c_str(), this->uart_baudrate_param);

    this->uart->registerMultiplexer(&(this->iomux));
  }
  else
  {
    throw std::runtime_error("Failed to connect to serial port");
  }

  heartbeat = new Heartbeater(getHandle(), (uint8_t)seagull_commons_msgs::SeagullHeartbeat::HB_AP_COMMS,
                                HEARTBEAT_INTERVAL_MS, seagull_commons::topics::TO_SEC2_HEARTBEAT_TOPIC);

}

/**
 * Helper method to publish data into the ROS Bus
 * @param len
 * @param buffer
 */
void AutopilotComms::publishFromPayload(uint32_t len, uint8_t buffer[BUFFER_LEN])
{
  seagull_autopilot_msgs::AutopilotPayload payload;
  payload.header.vehicleId = this->vehicle_id_param;
  payload.len = len;
  payload.data.insert(payload.data.begin(), buffer, buffer + len);
  this->from_payload_pub.publish(payload);
}

/**
 * Node loop
 */
void AutopilotComms::loop()
{

  uint8_t buffer[BUFFER_LEN];
  if (this->uart->poll(&(this->iomux), 1))
  {
    if (this->uart->isReady(&(this->iomux)))
    {
      uint32_t len = 0;
      if ((len = this->uart->read(buffer, BUFFER_LEN)) > 0)
      {

        publishFromPayload(len, buffer);
      }
    }
    else
    {
      //ROS_INFO("serial port not ready");
    }
  }
  else
  {
    //ROS_INFO("Failed to poll serial port");
  }

}
/**
 *	Create the publishers instances for each defined topic
 */
void AutopilotComms::setupPublishers()
{
  this->from_payload_pub = this->getHandle().advertise<seagull_autopilot_msgs::AutopilotPayload>(
      seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 1000);
}
/**
 * Create de subscribers instances for each defined topic
 * Assign a callback to each subscriber
 */
void AutopilotComms::setupSubscribers()
{
  this->to_payload_sub = this->getHandle().subscribe(seagull_autopilot::topics::AP_TO_PAYLOAD_TOPIC, 1000,
                                                     &AutopilotComms::toPayloadCallback, this);

}
/**
 * Handle Topic 
 */
void AutopilotComms::toPayloadCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg)
{
  if (this->vehicle_id_param == msg->header.vehicleId)
  {
    if (msg->len > this->uart->write((uint8_t*)&(msg->data[0]), msg->len))
    {
      ROS_INFO("Failed to send all to_payload message data");
    }
  }
  else
  {
    ROS_WARN("Received a to payload message request from a different vid:%d", msg->header.vehicleId);
  }
}

