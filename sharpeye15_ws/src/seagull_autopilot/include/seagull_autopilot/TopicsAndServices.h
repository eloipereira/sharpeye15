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
// Description: TopicsAndServices.h
//
// ==========================================================================

#ifndef SEAGULL_AUTOPILOT_TOPICSANDSERVICES_H_
#define SEAGULL_AUTOPILOT_TOPICSANDSERVICES_H_

#include <string>

namespace seagull_autopilot
{
namespace topics
{

//! Public constants for autopilot topics
const static std::string AP_COMMAND_TOPIC = "/autopilot_command";
//!
const static std::string AP_TRACK_WP_TOPIC = "/autopilot_track";
//!
const static std::string AP_TO_PAYLOAD_TOPIC = "/to_autopilot";
//!
const static std::string AP_FROM_PAYLOAD_TOPIC = "/from_autopilot";
//!
const static std::string AP_UPDATE_WP_TOPIC = "/autopilot_update_wp_pos";
//!
const static std::string AP_REQUEST_WPS_TOPIC = "/autopilot_request_waypoints";
//!
const static std::string AP_WP_LIST_FROM_AP_TOPIC = "/autopilot_wp_list_from_ap";
//!
const static std::string AP_WP_LIST_TO_AP_TOPIC = "/autopilot_wp_list_to_ap";
//!
const static std::string AP_WAYPOINT_TO_AP_TOPIC = "/autopilot_waypoint_to_ap";
//!
const static std::string AP_WAYPOINT_FROM_AP_TOPIC = "/autopilot_waypoint_from_ap";
//!
const static std::string AP_TELEMETRY_TOPIC = "/autopilot_telemetry";
//!
const static std::string AP_STATUS_TOPIC = "/autopilot_status";
//!
const static std::string AP_ADC_SAMPLES_TOPIC = "/autopilot_adc_samples";
//!
const static std::string AP_MISSION_LIMITS_TO_AP_TOPIC = "/autopilot_mission_limits_to_ap";
//!
const static std::string AP_MISSION_LIMITS_FROM_AP_TOPIC = "/autopilot_mission_limits_from_ap";
//!
const static std::string AP_MISSION_SETTINGS_TOPIC = "/autopilot_mission_settings";
//!
const static std::string AP_WARNING_TOPIC = "/autopilot_warning";
//!
const static std::string AP_USER_ACTION_TOPIC = "/autopilot_user_action";
//!
const static std::string AP_ZERO_LENGTH_TOPIC= "/autopilot_zero_length";
//!
const static std::string AP_TO_GIMBAL_TOPIC = "/to_gimbal";
//!
const static std::string AP_FROM_GIMBAL_TOPIC = "/from_gimbal";



}  // namespace topics
namespace services
{


}  // namespace services

}  // namespace seagull_navigation

#endif /* SEAGULL_AUTOPILOT_TOPICSANDSERVICES_H_ */
