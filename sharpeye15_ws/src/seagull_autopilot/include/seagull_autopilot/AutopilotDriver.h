// ==========================================================================
// Copyright (C) 2013 Portuguese Air Force Academy                       =
// Research Center                                                          =
// Granja do Marques, Academia, Pero-Pinheiro                               =
// ==========================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
// ==========================================================================
// Project: Project@build
// Date:    Jan 17, 2014
// Author:  posilva
// -------------------------------------------------------------------------=
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Description: AutopilotDriver.h
//
// ==========================================================================

#ifndef AUTOPILOTDRIVER_H_
#define AUTOPILOTDRIVER_H_
//! STD Headers

#include <Piccolo/SDK/Core/CommunicationManager.h>
#include <Piccolo/SDK/Core/Packets/PacketConstants.h>
#include <Piccolo/SDK/Core/Packets/WaypointListPacket.h>
#include <Piccolo/SDK/SDK.h>
#include <ros/publisher.h>
#include <ros/subscriber.h>
#include <seagull_autopilot_msgs/AutopilotCommand.h>
#include <seagull_autopilot_msgs/AutopilotPayload.h>
#include <seagull_autopilot_msgs/AutopilotRequestWaypoints.h>
#include <seagull_autopilot_msgs/AutopilotTrack.h>
#include <seagull_autopilot_msgs/AutopilotWaypoint.h>
#include <seagull_autopilot_msgs/AutopilotWPList.h>
#include <seagull_autopilot_msgs/AutopilotWarning.h>
#include <seagull_autopilot_msgs/AutopilotMissionLimits.h>
#include <seagull_autopilot_msgs/AutopilotMissionSettings.h>
#include <seagull_autopilot_msgs/AutopilotADCSamples.h>
#include <seagull_autopilot_msgs/AutopilotUserAction.h>
#include <seagull_autopilot_msgs/AutopilotZeroLength.h>
#include <seagull_autopilot_msgs/AutopilotGimbalPayload.h>
#include <seagull_commons/Heartbeater.h>
#include <seagull_commons/ROSNode.h>
#include <sys/types.h>
#include <string>
#include <vector>
#include <boost/date_time.hpp>
using namespace boost::posix_time;
using namespace boost::gregorian;
class Heartbeater;

const static std::string AP_CONN_TYPE_PARAM = "ap_conn_type";
const static std::string AP_PORT_PARAM = "ap_port";
const static std::string AP_HOST_PARAM = "ap_host";
const static std::string AP_BAUDRATE_PARAM = "ap_baudrate";
const static std::string AP_DEVICE_PARAM = "ap_device";
const static std::string AP_PAYLOAD_STREAM_PARAM = "ap_payloadstream";

const static int32_t AP_CONN_TYPE_PARAM_DEFAULT = Piccolo::SDK::Core::SOCKET;
const static std::string AP_PORT_PARAM_DEFAULT = "2001";
const static std::string AP_HOST_PARAM_DEFAULT = "localhost";
const static std::string AP_BAUDRATE_PARAM_DEFAULT = "57600";
const static std::string AP_DEVICE_PARAM_DEFAULT = "/dev/ttyS0";
const static bool AP_PAYLOAD_STREAM_PARAM_DEFAULT = false;

/*!
 * This is the autopilot driver
 *
 */
class AutopilotDriver : public ROSNode
{
public:
  AutopilotDriver();
  virtual ~AutopilotDriver();
  //!- Implements the super class abstract methods
  virtual void
  setup();
  virtual void
  loop();

private:
  ptime gps_epoch;
  unsigned short elapsedT;

  //!- ROS Subscribers
  ros::Publisher telemetry_pub;
  ros::Publisher status_pub;
  ros::Publisher wp_list_from_ap_pub;
  ros::Publisher waypoint_from_ap_pub;
  ros::Publisher from_payload_pub;
  ros::Publisher from_gimbal_pub;
  ros::Publisher user_warning_pub;
  ros::Publisher adc_sample_pub;
  ros::Publisher mission_limits_pub;
  ros::Publisher mission_settings_pub;

  //!- ROS Publishers
  ros::Subscriber command_sub;
  ros::Subscriber track_sub;
  ros::Subscriber to_payload_sub;
  ros::Subscriber to_gimbal_sub;

  ros::Subscriber request_wp_sub;
  ros::Subscriber wp_list_to_ap_sub;
  ros::Subscriber waypoint_to_ap_sub;
  ros::Subscriber update_wp_sub;
  ros::Subscriber mission_limits_sub;
  ros::Subscriber user_action_sub;
  ros::Subscriber zero_length_sub;
  //! Autopilot communication Manager
  Piccolo::SDK::Core::CommunicationManager *commManager;
  //!
  std::vector<Piccolo::SDK::Core::Packets::StreamType> selectedStreams;

  //! Parameters holders
  bool handle_payload_param;
  //! The connection type used (0-Serial,1-Socket)
  Piccolo::SDK::Core::ConnectionType connection_type;

  Heartbeater * heartbeat;
  static const int HEARTBEAT_INTERVAL_MS = 2000;

  //! Initiate Subscribers
  void setupSubscribers();
  //! Initiate Publishers
  void setupPublishers();

  //! Callbacks

  void commandCallback(const seagull_autopilot_msgs::AutopilotCommand::ConstPtr& msg);
  void toPayloadCallback(const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg);
  void updateWaypointCallback(const seagull_autopilot_msgs::AutopilotWaypoint::ConstPtr& msg);
  void requestWaypointsCallback(const seagull_autopilot_msgs::AutopilotRequestWaypoints::ConstPtr& msg);
  void waypointToAPCallback(const seagull_autopilot_msgs::AutopilotWaypoint::ConstPtr& msg);
  void wpListToAPCallback(const seagull_autopilot_msgs::AutopilotWPList::ConstPtr& msg);
  void trackCallback(const seagull_autopilot_msgs::AutopilotTrack::ConstPtr& msg);
  void waypointsToAPCallback(const seagull_autopilot_msgs::AutopilotRequestWaypoints::ConstPtr& msg);
  void createWaypointListRequestPacket(Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags,
                                       BYTE_VECTOR* payload);
  void createWaypointListDeletePacket(Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags, BYTE_VECTOR* payload);
  void createWaypointListAddPacket(Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags, BYTE_VECTOR* payload);
  void missionLimitsCallback(const seagull_autopilot_msgs::AutopilotMissionLimits::ConstPtr& msg);
  void missionSettingsCallback(const seagull_autopilot_msgs::AutopilotMissionSettings::ConstPtr& msg);
  void userActionCallback(const seagull_autopilot_msgs::AutopilotUserAction::ConstPtr& msg);
  void zeroLengthCallback(const seagull_autopilot_msgs::AutopilotZeroLength::ConstPtr& msg);
  void toGimbalPayloadCallback(const seagull_autopilot_msgs::AutopilotGimbalPayload::ConstPtr& msg);;

  //!
  PARAMETERS_T setupParameters();
  void handleAutopilotStream(BYTE_VECTOR& payload);

  void handlePayloadstream(BYTE_VECTOR& payload);
  void handleGimbalPayloadstream(BYTE_VECTOR& payload);

  void
  publishAutopilotWarning(const ros::Publisher& pub, const Piccolo::SDK::Core::Packets::UserWarningPacket& pkt);
  void
  publishMissionLimits(const ros::Publisher& pub, const Piccolo::SDK::Core::Packets::MissionLimitsPacket& pkt);
  void
  publishExternalADCSample(const ros::Publisher& pub, const Piccolo::SDK::Core::Packets::ExternalADCSamplePacket& pkt);
  void
  publishWaypointList(const ros::Publisher& pub, Piccolo::SDK::Core::Packets::WaypointListPacket* pkt);

  void
  publishWaypoint(const ros::Publisher& pub, Piccolo::SDK::Core::Packets::WaypointPacket* pkt);
  void
  publishStatus(const ros::Publisher& pub, Piccolo::SDK::Core::Packets::SystemsStatusHighResolutionPacket* pkt);

  void
  publishTelemetry(const ros::Publisher& pub,
                   Piccolo::SDK::Core::Packets::TelemetryHighResolutionPacket* telemetryPacket);
  void publishFromPayloadStream(const seagull_autopilot_msgs::AutopilotPayload& m);
  void publishFromGimbalStream(const seagull_autopilot_msgs::AutopilotGimbalPayload& m);
    //Utils
  void setWaypoint(int wp, BYTE_VECTOR& payload);
};

#endif /* AUTOPILOTDRIVER_H_ */
