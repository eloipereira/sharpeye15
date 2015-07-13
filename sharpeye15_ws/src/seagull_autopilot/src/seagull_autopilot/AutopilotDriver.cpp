/// ==========================================================================
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
// Description: AutopilotDriver.cpp
//
// ==========================================================================
//! STD Headers
#include <ros/console.h>
#include <ros/node_handle.h>
#include <ros/rate.h>
#include <rosconsole/macros_generated.h>

//
#include <stdint.h>
#include <string.h>
#include <stdexcept>
//
#include <Piccolo/SDK/Core/Packets/AutopilotStream.h>
#include <Piccolo/SDK/Core/Packets/PacketConstants.h>
#include <Piccolo/SDK/Core/Packets/PayloadStream.h>
#include <Piccolo/SDK/Core/Packets/Packets.h>
#include <Piccolo/SDK/Utils.h>
//

#include <seagull_autopilot/TopicsAndServices.h>
#include <seagull_autopilot_msgs/AutopilotStatus.h>
#include <seagull_autopilot_msgs/AutopilotTelemetry.h>
//
#include <seagull_commons_msgs/SeagullHeader.h>
#include <seagull_commons_msgs/SeagullHeartbeat.h>
#include <seagull_commons/TopicsAndServices.h>

#include <seagull_autopilot/AutopilotDriver.h>


/**
 * Node constructor
 */
AutopilotDriver::AutopilotDriver() :
		ROSNode(true), commManager(0), handle_payload_param(
				AP_PAYLOAD_STREAM_PARAM_DEFAULT), connection_type(
				Piccolo::SDK::Core::SERIAL), heartbeat(0) {

	ptime t(date(1980,1,6),time_duration(0,0,0));

	gps_epoch=t;
}
/**
 * Node destructor
 * Release resources
 */
AutopilotDriver::~AutopilotDriver() {

	delete heartbeat;
	delete commManager;
}
/**
 * Node Setup procedures
 */
void AutopilotDriver::setup() {
	PARAMETERS_T params = setupParameters();

	setupSubscribers();
	setupPublishers();
	ros::Rate loop_rate(100);

	commManager = new Piccolo::SDK::Core::CommunicationManager(
			this->connection_type, params);
	commManager->init();

	selectedStreams.push_back(Piccolo::SDK::Core::Packets::AUTOPILOT_STREAM);

	selectedStreams.push_back(Piccolo::SDK::Core::Packets::GIMBAL_STREAM);

	if (this->handle_payload_param) {
		selectedStreams.push_back(Piccolo::SDK::Core::Packets::PAYLOAD_STREAM);
	}

	heartbeat = new Heartbeater(getHandle(),
			(uint8_t) seagull_commons_msgs::SeagullHeartbeat::HB_AP_DRIVER,
			HEARTBEAT_INTERVAL_MS,
			seagull_commons::topics::TO_SEC2_HEARTBEAT_TOPIC);

}

/**
 * Node Loop
 */
void AutopilotDriver::loop() {
	try {
		BYTE_VECTOR payload;
		if (this->commManager->getStreams(selectedStreams, payload)) {
			switch (payload[10]) {
			case Piccolo::SDK::Core::Packets::AUTOPILOT_STREAM:
				handleAutopilotStream(payload);
				break;
			case Piccolo::SDK::Core::Packets::PAYLOAD_STREAM:
				if (this->handle_payload_param) {
					handlePayloadstream(payload);
				}
				break;
			case Piccolo::SDK::Core::Packets::GIMBAL_STREAM:
				handleGimbalPayloadstream(payload);
				break;
			default:
				break;
			}
		}
	} catch (std::exception &e) {
		ROS_ERROR("%s", e.what());
	}
}
/**
 *  Function to handle with a received autopilotstream packet
 *  this stream have multiple packet formats here we do the
 *  logic related with the packet
 *  @param payload - output argument to return the parsed info
 */
void AutopilotDriver::handleAutopilotStream(BYTE_VECTOR& payload) {

	uint16_t source = Piccolo::SDK::Utils::UChar2UShort(payload[4], payload[5]);
	if (source != 0 && source != 0xffff) {
		BYTE_VECTOR streamPayload;
		BYTE_VECTOR packet;
		commManager->GetDataFromStreamPacket(payload, &streamPayload);
		while (commManager->consumeAPStreamPacket(streamPayload, &packet)) {
			Piccolo::SDK::Core::Packets::AutopilotStreamPacket* autopilotStreamPkt =
					new Piccolo::SDK::Core::Packets::AutopilotStreamPacket();
			autopilotStreamPkt->load(packet);

			switch (autopilotStreamPkt->getType()) {
			case Piccolo::SDK::Core::Packets::EXTERNAL_ADC_SAMPLE: {

				Piccolo::SDK::Core::Packets::ExternalADCSamplePacket pkt;
				pkt.setSourceId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				pkt.load(autopilotStreamPkt->getPayload());
				publishExternalADCSample(adc_sample_pub, pkt);
				break;
			}

			case Piccolo::SDK::Core::Packets::MISSION_LIMITS: {
				//std::cout << "RECEIVED A MISSION LIMITS PACKET\n";
				Piccolo::SDK::Core::Packets::MissionLimitsPacket pkt;
				pkt.setSourceId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				pkt.load(autopilotStreamPkt->getPayload());
				publishMissionLimits(mission_limits_pub, pkt);

				break;
			}
			case Piccolo::SDK::Core::Packets::USER_WARNING: {
				Piccolo::SDK::Core::Packets::UserWarningPacket pkt;
				pkt.setSourceId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				pkt.load(autopilotStreamPkt->getPayload());
				publishAutopilotWarning(user_warning_pub, pkt);
				break;
			}

			case Piccolo::SDK::Core::Packets::TELEMETRY_HI_RES: {
				Piccolo::SDK::Core::Packets::TelemetryHighResolutionPacket* telP =
						new Piccolo::SDK::Core::Packets::TelemetryHighResolutionPacket();
				telP->setSourceId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				telP->load(autopilotStreamPkt->getPayload());
				//! publish short packet
				publishTelemetry(telemetry_pub, telP);
				delete (telP);
				break;
			}
			case Piccolo::SDK::Core::Packets::STATUS_HI_RES: {
				Piccolo::SDK::Core::Packets::SystemsStatusHighResolutionPacket * pkt =
						new Piccolo::SDK::Core::Packets::SystemsStatusHighResolutionPacket();
				pkt->setVehicleId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));

				pkt->load(autopilotStreamPkt->getPayload());
				if (autopilotStreamPkt->getPayload()->size() == 41) // Short version
					publishStatus(status_pub, pkt);
				delete (pkt);
				break;
			}
			case Piccolo::SDK::Core::Packets::WAYPOINT: {
				Piccolo::SDK::Core::Packets::WaypointPacket * pkt =
						new Piccolo::SDK::Core::Packets::WaypointPacket();
				pkt->setVehicleId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				pkt->setVehicleId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));
				pkt->load(*autopilotStreamPkt->getPayload());
				publishWaypoint(waypoint_from_ap_pub, pkt);
				break;
			}
			case Piccolo::SDK::Core::Packets::WAYPOINT_LIST: {
				Piccolo::SDK::Core::Packets::WaypointListPacket * pkt =
						new Piccolo::SDK::Core::Packets::WaypointListPacket();
				pkt->setVehicleId(
						Piccolo::SDK::Utils::UChar2UShort(payload[4],
								payload[5]));

				pkt->load(autopilotStreamPkt->getPayload());
				publishWaypointList(wp_list_from_ap_pub, pkt);

				break;
			}
			default:
				break;
			}
			delete (autopilotStreamPkt);
		}
	}
}

/**
 * Handle a payload stream message received from autopilot and publish
 * in ROS env
 */
void AutopilotDriver::handlePayloadstream(BYTE_VECTOR& payload) {
	seagull_autopilot_msgs::AutopilotPayload m;
	commManager->GetDataFromStreamPacket(payload,
			reinterpret_cast<BYTE_VECTOR*>(&m.data));
	m.header.vehicleId = Piccolo::SDK::Utils::UChar2UShort(payload[4],
			payload[5]);
	m.len = m.data.size();

	publishFromPayloadStream(m);
}

/**
 *	Get parameters from parameter server
 *	Assign default values to parameters
 */
PARAMETERS_T AutopilotDriver::setupParameters() {
	PARAMETERS_T params;

	int32_t conn_type = AP_CONN_TYPE_PARAM_DEFAULT;
	readParam(AP_CONN_TYPE_PARAM, conn_type, conn_type);

	//! Verify if we must handle payload stream
	readParam(AP_PAYLOAD_STREAM_PARAM, this->handle_payload_param,
			this->handle_payload_param);

	if (conn_type == Piccolo::SDK::Core::SOCKET) {

		this->connection_type = Piccolo::SDK::Core::SOCKET;
		params["port"] = AP_PORT_PARAM_DEFAULT;
		readParam(AP_PORT_PARAM, params["port"], params["port"]);
		params["host"] = AP_HOST_PARAM_DEFAULT;
		readParam(AP_HOST_PARAM, params["host"], params["host"]);
		ROS_WARN("Connection parameters: %s:%s", params["host"].c_str(),
				params["port"].c_str());
	} else {
		this->connection_type = Piccolo::SDK::Core::SERIAL;
		params["device"] = AP_DEVICE_PARAM_DEFAULT;
		readParam(AP_DEVICE_PARAM, params["device"], params["device"]);
		params["baudrate"] = AP_BAUDRATE_PARAM_DEFAULT;
		readParam(AP_BAUDRATE_PARAM, params["baudrate"], params["baudrate"]);
		ROS_WARN("Connection parameters: %s:%s", params["device"].c_str(),
				params["baudrate"].c_str());
	}

	return params;
}
/**
 *	Create the publishers instances for each defined topic
 */
void AutopilotDriver::setupPublishers() {

	this->telemetry_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotTelemetry>(
			seagull_autopilot::topics::AP_TELEMETRY_TOPIC, 10);

	this->status_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotStatus>(
			seagull_autopilot::topics::AP_STATUS_TOPIC, 10);

	this->wp_list_from_ap_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotWPList>(
			seagull_autopilot::topics::AP_WP_LIST_FROM_AP_TOPIC, 10);

	this->waypoint_from_ap_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotWaypoint>(
			seagull_autopilot::topics::AP_WAYPOINT_FROM_AP_TOPIC, 100);

	this->user_warning_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotWarning>(
			seagull_autopilot::topics::AP_WARNING_TOPIC, 10);
	this->mission_limits_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotMissionLimits>(
			seagull_autopilot::topics::AP_MISSION_LIMITS_FROM_AP_TOPIC, 10);
	this->mission_settings_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotMissionSettings>(
			seagull_autopilot::topics::AP_MISSION_SETTINGS_TOPIC, 10);
	this->adc_sample_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotADCSamples>(
			seagull_autopilot::topics::AP_ADC_SAMPLES_TOPIC, 10);

	if (this->handle_payload_param) {
		this->from_payload_pub = this->getHandle().advertise<
				seagull_autopilot_msgs::AutopilotPayload>(
				seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 100);
	}
	this->from_gimbal_pub = this->getHandle().advertise<
			seagull_autopilot_msgs::AutopilotGimbalPayload>(
			seagull_autopilot::topics::AP_FROM_GIMBAL_TOPIC, 100);
}
/**
 * Create de subscribers instances for each defined topic
 * Assign a callback to each subscriber
 */
void AutopilotDriver::setupSubscribers() {
	this->command_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_COMMAND_TOPIC, 10,
			&AutopilotDriver::commandCallback, this);

	this->track_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_TRACK_WP_TOPIC, 10,
			&AutopilotDriver::trackCallback, this);
	this->update_wp_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_UPDATE_WP_TOPIC, 10,
			&AutopilotDriver::updateWaypointCallback, this);

	this->wp_list_to_ap_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_WP_LIST_TO_AP_TOPIC, 10,
			&AutopilotDriver::wpListToAPCallback, this);

	this->request_wp_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_REQUEST_WPS_TOPIC, 10,
			&AutopilotDriver::requestWaypointsCallback, this);

	this->waypoint_to_ap_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_WAYPOINT_TO_AP_TOPIC, 10,
			&AutopilotDriver::waypointToAPCallback, this);

	this->mission_limits_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_MISSION_LIMITS_TO_AP_TOPIC, 10,
			&AutopilotDriver::missionLimitsCallback, this);

	this->user_action_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_USER_ACTION_TOPIC, 10,
			&AutopilotDriver::userActionCallback, this);

	this->zero_length_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_ZERO_LENGTH_TOPIC, 10,
			&AutopilotDriver::zeroLengthCallback, this);

	if (this->handle_payload_param) {
		this->to_payload_sub = this->getHandle().subscribe(
				seagull_autopilot::topics::AP_TO_PAYLOAD_TOPIC, 2000,
				&AutopilotDriver::toPayloadCallback, this);
	}
	this->to_gimbal_sub = this->getHandle().subscribe(
			seagull_autopilot::topics::AP_TO_GIMBAL_TOPIC, 2000,
			&AutopilotDriver::toGimbalPayloadCallback, this);
}
/**
 *	Publish a waypointlist to the ROS env
 */
void AutopilotDriver::publishWaypointList(const ros::Publisher& pub,
		Piccolo::SDK::Core::Packets::WaypointListPacket* pkt) {
	ROS_INFO("%s", pkt->toString().c_str());
	seagull_autopilot_msgs::AutopilotWPList msg;
	Piccolo::SDK::Core::Packets::WaypointListPacket wpl;
	msg.header.vehicleId = pkt->getVehicleId();
	std::vector<uint8_t> v = pkt->getActiveWaypoints();
	msg.list.insert(msg.list.begin(), v.begin(), v.end());
	pub.publish(msg);
}
/**
 * Publish a waypoint to the ROS env
 */
void AutopilotDriver::publishWaypoint(const ros::Publisher& pub,
		Piccolo::SDK::Core::Packets::WaypointPacket* pkt) {
	seagull_autopilot_msgs::AutopilotWaypoint msg;
	msg.altitude = pkt->getAltitude();
	msg.header.vehicleId = pkt->getVehicleId();
	msg.index = pkt->getIndex();
	msg.next = pkt->getNext();
	msg.latitude = pkt->getLatitude();
	msg.longitude = pkt->getLongitude();
	msg.deployParachute = pkt->isDeployParachute();
	msg.deployDrop = pkt->isDeployDrop();
	msg.orbitDirection = pkt->isOrbitDirection();
	msg.cameraTarget = pkt->isCameraTarget();
	msg.landingPoint = pkt->isLandingPoint();
	msg.slopeControl = pkt->isSlopeControl();
	msg.lightsOn = pkt->isLightsOn();
	msg.preTurn = pkt->isPreTurn();
	msg.orbitTime = pkt->getOrbitTime();
	msg.orbitRadius = pkt->getOrbitRadius();
	msg.altitude = pkt->getAltitude();
	msg.windFind = pkt->getWindFind();
	msg.orbitTime = pkt->getOrbitTime();
	msg.user = pkt->getUser();
	msg.orbitAbove = pkt->isOrbitAbove();
	msg.orbitBelow = pkt->isOrbitBelow();
	msg.hoverPoint = pkt->isHoverPoint();
	msg.altitudeToGround = pkt->isAltitudeToGround();
	msg.orbitMultiplier50 = pkt->isOrbitMultiplier50();
	msg.altLSB = pkt->getAltLsb();
	pub.publish(msg);
}
/**
 * Publish a autopilot status message to the ROS env
 */
void AutopilotDriver::publishStatus(const ros::Publisher& pub,
		Piccolo::SDK::Core::Packets::SystemsStatusHighResolutionPacket* pkt) {
	// load ROS message

	seagull_autopilot_msgs::AutopilotStatus msg;

	msg.header.vehicleId = pkt->getVehicleId();

	msg.orbitRadius = pkt->getOrbitRadius();
	msg.trackerStatus = pkt->getTrackerStatus();
	msg.timeToWp = pkt->getTimeToWp();
	msg.wpFrom = pkt->getWaypointFrom();
	msg.wpTo = pkt->getWaypointTo();
	msg.airBoundaryViolated = pkt->isAirBoundaryViolated();
	msg.autopilotEngineKill = pkt->isAutopilotEngineKill();
	msg.commsTimeout = pkt->isCommsTimeout();
	msg.fligthTimerElapsed = pkt->isFlightTimerElapsed();
	msg.fligthTermination = pkt->isFligthTermination();
	msg.gpsTimeout = pkt->isGpsTimeout();
	msg.orbiting = pkt->isOrbiting();
	msg.loopControl1 = pkt->getStatusLoop1();
	msg.loopControl2 = pkt->getStatusLoop2();
	msg.loopControl3 = pkt->getStatusLoop3();
	msg.loopControl4 = pkt->getStatusLoop4();
	msg.loopControl5 = pkt->getStatusLoop5();
	msg.loopControl6 = pkt->getStatusLoop6();
	msg.loopControl7 = pkt->getStatusLoop7();
	msg.loopControl8 = pkt->getStatusLoop8();
	msg.loopControlCount = pkt->getNumLoops();
	msg.userAction0 = pkt->isUserStatus0();
	msg.userAction1 = pkt->isUserStatus1();
	msg.userAction2 = pkt->isUserStatus2();
	msg.userAction3 = pkt->isUserStatus3();
	msg.userAction4 = pkt->isUserStatus4();
	msg.userAction5 = pkt->isUserStatus5();
	msg.userAction6 = pkt->isUserStatus6();
	msg.userAction7 = pkt->isUserStatus7();
	pub.publish(msg);
}
/**
 * Publish a autopilot telemetry message to the ROS env
 */
void AutopilotDriver::publishTelemetry(const ros::Publisher& pub,
		Piccolo::SDK::Core::Packets::TelemetryHighResolutionPacket* telemetryPacket) {
	// load ROS message
	seagull_autopilot_msgs::AutopilotTelemetry msg;
	msg.header.header.stamp = ros::Time::now();
	msg.header.vehicleId = telemetryPacket->getSourceId();
	msg.latitude = telemetryPacket->getLatitude();
	msg.longitude = telemetryPacket->getLongitude();
	msg.altitude = telemetryPacket->getHeight();
	msg.ias = telemetryPacket->getIas();
	msg.accelX = telemetryPacket->getAccelX();
	msg.accelY = telemetryPacket->getAccelY();
	msg.accelZ = telemetryPacket->getAccelZ();
	msg.roll = telemetryPacket->getRoll();
	msg.pitch = telemetryPacket->getPitch();
	msg.yaw = telemetryPacket->getYaw();
	msg.agl = telemetryPacket->getAgl();
	msg.barometricAltitude = telemetryPacket->getBarometricAltitude();
	msg.compass = telemetryPacket->getHeading();
	msg.leftRPM = telemetryPacket->getLeftRpm();
	msg.rightRPM = telemetryPacket->getRightRpm();
	msg.staticPressure = telemetryPacket->getStaticPressure();
	msg.vx = telemetryPacket->getNorth();
	msg.vy = telemetryPacket->getEast();
	msg.vz = telemetryPacket->getDown();
	msg.windSouth = telemetryPacket->getWindSouth();
	msg.windWest = telemetryPacket->getWindWest();
	msg.fuel = telemetryPacket->getFuel();

	ptime ts= (gps_epoch + weeks(telemetryPacket->getGpsWeek()) +  milliseconds(telemetryPacket->getGpsTimeOfWeek()));
	msg.timestamp=(ts-ptime(date(1970,1,1),time_duration(0,0,0))).total_milliseconds();
	//std::cout<<"GMT Message Time Stamp:" << ts <<" Milliseconds: "<< msg.timestamp<<"\n";
	pub.publish(msg);
}
/**
 *
 * @param m
 */
void AutopilotDriver::publishFromPayloadStream(
		const seagull_autopilot_msgs::AutopilotPayload& m) {
	if (this->handle_payload_param)
		from_payload_pub.publish(m);

	ROS_WARN("Received PayloadStream");

}

/**
 *	Receive a command to send to autopilot
 *	Tipical this command is a pair (command_id,value)
 */
void AutopilotDriver::commandCallback(
		const seagull_autopilot_msgs::AutopilotCommand::ConstPtr& msg) {

	if (!this->commManager->SendAutopilotCommandPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			msg->command_code, msg->value,
			Piccolo::SDK::Core::Packets::AutopilotLoopPacket::ON, false)) {
		ROS_WARN("Failed to send command to AP(%d): %d with value %.8f",
				msg->header.vehicleId, msg->command_code, msg->value);
	} else {
		//ROS_WARN("Send command to AP(%d): %d with value %.8f", msg->header.vehicleId, msg->command_code, msg->value);
	}
}

/**
 *	Receive a payload message and forward to payload stream
 *	of the autopilot
 */
void AutopilotDriver::toPayloadCallback(
		const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg) {
	BYTE_VECTOR data;

	data.insert(data.begin(), msg->data.begin(), msg->data.end());
	if (!commManager->SendPayloadPacket(commManager->getRemoteAddress(),
			msg->header.vehicleId, &data)) {
		ROS_WARN("Failed to send data to payload stream");
	}

}
/**
 *	Receive a waypoint action command add or delete and forward to autopilot
 *
 */
void AutopilotDriver::wpListToAPCallback(
		const seagull_autopilot_msgs::AutopilotWPList::ConstPtr& msg) {
	ROS_INFO("[AutopilotDriver] - Received a AutopilotWPList message");
	Piccolo::SDK::Core::Packets::WaypointListPacket pkt;
	pkt.setVehicleId(msg->header.vehicleId);

	Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags =
			Piccolo::SDK::Core::Packets::RequestAllWaypoints;
	switch (msg->type) {
	case seagull_autopilot_msgs::AutopilotWPList::LT_REQUEST:
		ROS_INFO("[AutopilotDriver] Requesting Waypoint List");
		flags = Piccolo::SDK::Core::Packets::RequestAllWaypoints;
		break;
	case seagull_autopilot_msgs::AutopilotWPList::LT_ADD:
		ROS_INFO("[AutopilotDriver] Add Waypoint List");
		flags = Piccolo::SDK::Core::Packets::InitiateWaypointsTransfer;
		break;
	case seagull_autopilot_msgs::AutopilotWPList::LT_DELETE:
		ROS_INFO("[AutopilotDriver] Remove Waypoint List");
		flags = Piccolo::SDK::Core::Packets::DeleteWaypoints;
		break;
	default:
		ROS_ERROR("Invalid message type for WaypointListPacket: %d", msg->type);
		return;
	}

	BYTE_VECTOR wp0to103;
	wp0to103.resize(13, 0);
	memset(&(wp0to103[0]), 0x00, 13);

	BYTE_VECTOR wp104to249;
	wp104to249.resize(19, 0);
	memset(&(wp104to249[0]), 0x00, 19);

	for (int var = 0; var < msg->list.size(); ++var) {
		ROS_INFO("[AutopilotDriver]  Delete waypoint :%d", msg->list[var]);
		if (msg->list[var] < 104) {
			setWaypoint(msg->list[var], wp0to103);
		} else if (msg->list[var] > 104 && msg->list[var] < 250) {
			setWaypoint(msg->list[var], wp104to249);
		}
	}
	pkt.setWaypoints0To103(wp0to103);
	pkt.setWaypoints103To249(wp104to249);
	pkt.setFlags(flags);
	BYTE_VECTOR* payload = new BYTE_VECTOR();
	pkt.toRaw(payload);
	Piccolo::SDK::Debug::print(*payload);

	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::WAYPOINT_LIST, payload)) {
		ROS_INFO("[AutopilotDriver] %s", "Send Waypoint List Failed");
	}
	ROS_INFO("[AutopilotDriver] - Received a AutopilotWPList message END");
}
/**
 *
 * @param msg
 */
void AutopilotDriver::zeroLengthCallback(
		const seagull_autopilot_msgs::AutopilotZeroLength::ConstPtr& msg) {
	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			msg->messageType)) {
		ROS_ERROR("[AutopilotDriver] %s",
				"Send AutopilotZeroLength message Failed");
	}
}
/**
 *
 * @param msg
 */
void AutopilotDriver::toGimbalPayloadCallback(
		const seagull_autopilot_msgs::AutopilotGimbalPayload::ConstPtr& msg) {

	BYTE_VECTOR data;

	data.insert(data.begin(), msg->data.begin(), msg->data.end());
	if (!commManager->SendGimbalPacket(Piccolo::SDK::Core::Packets::OI_ADDRESS,
			msg->header.vehicleId, &data)) {
		ROS_WARN("Failed to send data to gimbal stream");
	}

}
/**
 *
 * @param payload
 */
void AutopilotDriver::handleGimbalPayloadstream(BYTE_VECTOR& payload) {
	seagull_autopilot_msgs::AutopilotGimbalPayload m;
	commManager->GetDataFromStreamPacket(payload,
			reinterpret_cast<BYTE_VECTOR*>(&m.data));
	m.header.vehicleId = Piccolo::SDK::Utils::UChar2UShort(payload[4],
			payload[5]);
	m.len = m.data.size();
	publishFromGimbalStream(m);

}
/**
 *
 */
void AutopilotDriver::publishFromGimbalStream(
		const seagull_autopilot_msgs::AutopilotGimbalPayload& m) {
	from_gimbal_pub.publish(m);
}

void AutopilotDriver::setWaypoint(int wp, BYTE_VECTOR& payload) {
	int i = wp / 8;
	int b = wp % 8;
	int mask = 1 << (8 - (b + 1));
	payload[i] |= mask;
	ROS_INFO("[AutopilotDriver] Set waypoint %d at byte %d and bit %d mask %d",
			wp, i, b, mask);
}/**
 * Receive a waypoint to update AP
 */
void AutopilotDriver::waypointToAPCallback(
		const seagull_autopilot_msgs::AutopilotWaypoint::ConstPtr& msg) {
	Piccolo::SDK::Core::Packets::WaypointPacket pkt;
	pkt.setAltitude(msg->altitude);
	pkt.setLongitude(msg->longitude);
	pkt.setLatitude(msg->latitude);
	pkt.setIndex(msg->index);
	pkt.setNext(msg->next);
	pkt.setLandingPoint(msg->landingPoint);
	pkt.setDeployParachute(msg->deployParachute);
	pkt.setDeployDrop(msg->deployDrop);
	pkt.setPreTurn(msg->preTurn);
	pkt.setSlopeControl(msg->slopeControl);
	pkt.setOrbitRadius(msg->orbitRadius);
	BYTE_VECTOR* payload = new BYTE_VECTOR(18);
	pkt.toRaw(payload);

	Piccolo::SDK::Core::Packets::WaypointPacket pkt2;
	pkt2.load(*payload);

	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::WAYPOINT, payload)) {
		ROS_INFO("%s", "Send waypoint Failed");
	}
	delete payload;
}
/**
 *	Receive a waypoint update and forward to autopilot
 *
 */
void AutopilotDriver::updateWaypointCallback(
		const seagull_autopilot_msgs::AutopilotWaypoint::ConstPtr& msg) {
	ROS_INFO("Update Waypoint request received:%8.4f,%8.4f,%8.4f",
			msg->latitude, msg->longitude, msg->altitude);
	BYTE_VECTOR* payload = new BYTE_VECTOR(18);
	Piccolo::SDK::Core::Packets::WaypointPacket pkt;
	Piccolo::SDK::Core::Packets::WaypointPacket pkt2;

	ROS_INFO("Create a waypoint packet");
	pkt.setAltitude(msg->altitude);
	pkt.setLongitude(msg->longitude);

	ROS_INFO("PKT Waypoint :%8.4f,%8.4f,%8.4f", pkt.getLatitude(),
			pkt.getLongitude(), pkt.getAltitude());

	pkt.setLatitude(msg->latitude);
	pkt.setIndex(msg->index);
	pkt.setNext(msg->next);
	pkt.setLandingPoint(msg->landingPoint);
	pkt.setDeployParachute(msg->deployParachute);
	pkt.setDeployDrop(msg->deployDrop);
	pkt.setPreTurn(msg->preTurn);
	pkt.setSlopeControl(msg->slopeControl);
	pkt.setOrbitRadius(msg->orbitRadius);
	pkt.toRaw(payload);
	pkt2.load(*payload);
	ROS_INFO("PKT:%s ", pkt.toString().c_str());
	ROS_INFO("PKT2:%s ", pkt2.toString().c_str());
	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::WAYPOINT, payload)) {
		ROS_INFO("%s", "Send waypoint Failed");
	}
	delete payload;
}

/**
 *	Receive a track request, this means that the
 *	autopilot will start follow the indicated waypoint number
 */
void AutopilotDriver::trackCallback(
		const seagull_autopilot_msgs::AutopilotTrack::ConstPtr& msg) {
	if (!commManager->SendTrackPacket(Piccolo::SDK::Core::Packets::OI_ADDRESS,
			msg->header.vehicleId, msg->to, msg->go_to)) {
		ROS_INFO("%s", "Send track Failed");
	}
}

/**
 *	Receive a request for waypoint status refresh
 *	The autopilot will start sending waypoints
 */
void AutopilotDriver::requestWaypointsCallback(
		const seagull_autopilot_msgs::AutopilotRequestWaypoints::ConstPtr& msg) {
	BYTE_VECTOR payload;
	Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags =
			Piccolo::SDK::Core::Packets::RequestAllWaypoints;
	createWaypointListRequestPacket(flags, &payload);
	commManager->SendAutopilotStreamPacket(0, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::WAYPOINT_LIST, &payload);
}

/**
 * Utility function to create a list of waypoints add
 */
void AutopilotDriver::createWaypointListAddPacket(
		Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags,
		BYTE_VECTOR* payload) {
}
/**
 * Utility function to create a list of waypoints delete
 */
void AutopilotDriver::createWaypointListDeletePacket(
		Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags,
		BYTE_VECTOR* payload) {
}
/**
 * Utility function to create a list of waypoints request
 */
void AutopilotDriver::createWaypointListRequestPacket(
		Piccolo::SDK::Core::Packets::WaypointListActionsEnum flags,
		BYTE_VECTOR* payload) {
	Piccolo::SDK::Core::Packets::WaypointListPacket wpListPkt;
	BYTE_VECTOR wp0to103;
	wp0to103.resize(13, 0);
	memset(&(wp0to103[0]), 0xff, 13);
	BYTE_VECTOR wp104to249;

	wp104to249.resize(19, 0);
	memset(&(wp104to249[0]), 0xff, 19);
	wpListPkt.setWaypoints0To103(wp0to103);
	wpListPkt.setWaypoints103To249(wp104to249);
	wpListPkt.setFlags(flags);
	wpListPkt.toRaw(payload);
}
/**
 *
 * @param msg
 */
void AutopilotDriver::missionLimitsCallback(
		const seagull_autopilot_msgs::AutopilotMissionLimits::ConstPtr& msg) {

	if (msg->request) {
		if (!commManager->SendAutopilotStreamPacket(
				Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
				Piccolo::SDK::Core::Packets::MISSION_SETTINGS)) {
			ROS_INFO("[AutopilotDriver] %s", "Mission limits request done");
		}
	} else {
		ROS_ERROR("AutopilotMissionLimits update not implemented yet");
	}
}
/**
 *
 * @param msg
 */
void AutopilotDriver::missionSettingsCallback(
		const seagull_autopilot_msgs::AutopilotMissionSettings::ConstPtr& msg) {

	BYTE_VECTOR payload;
	Piccolo::SDK::Core::Packets::MissionSettingsPacket pkt;
	pkt.setAltitudeMax(msg->altitude_max);
	pkt.setAltitudeMin(msg->altitude_min);
	pkt.setFligthTimeout(msg->fligth_timeout);
	pkt.toRaw(&payload);
	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::MISSION_SETTINGS, &payload)) {
		ROS_INFO("[AutopilotDriver] %s", "Mission limits request done");
	}

}
/**
 *
 * @param pub
 * @param pkt
 */
void AutopilotDriver::publishAutopilotWarning(const ros::Publisher& pub,
		const Piccolo::SDK::Core::Packets::UserWarningPacket& pkt) {

	seagull_autopilot_msgs::AutopilotWarning msg;
	msg.header.header.stamp = ros::Time::now();
	msg.header.vehicleId = pkt.getSourceId();

	msg.command = pkt.getType();
	msg.code = pkt.getCode();
	msg.message = pkt.getWarning();

	pub.publish(msg);
}
/**
 *
 * @param pub
 * @param pkt
 */
void AutopilotDriver::publishMissionLimits(const ros::Publisher& pub,
		const Piccolo::SDK::Core::Packets::MissionLimitsPacket& pkt) {
	seagull_autopilot_msgs::AutopilotMissionLimits msg;
	msg.header.header.stamp = ros::Time::now();
	msg.header.vehicleId = pkt.getSourceId();

	msg.altitude_min = pkt.getAltitudeMin();
	msg.altitude_max = pkt.getAltitudeMax();
	msg.fligth_timeout = pkt.getFligthTimeout();
	msg.autoland_wp = pkt.getAutolandWaypoint();
	msg.lost_comms_wp = pkt.getLostCommWaypoint();
	msg.comms_timeout = pkt.getCommsTimeout();
	msg.gps_timeout = pkt.getGpsTimeout();
	msg.pilot_timeout = pkt.getPilotTimeout();
	msg.failure0 = pkt.getFailure1();
	msg.failure1 = pkt.getFailure1();
	pub.publish(msg);

}
/**
 *
 * @param pub
 * @param pkt
 */
void AutopilotDriver::publishExternalADCSample(const ros::Publisher& pub,
		const Piccolo::SDK::Core::Packets::ExternalADCSamplePacket& pkt) {
	seagull_autopilot_msgs::AutopilotADCSamples msg;
	msg.header.header.stamp = ros::Time::now();
	msg.header.vehicleId = pkt.getSourceId();

	msg.analog1 = pkt.getAnalog1();
	msg.analog2 = pkt.getAnalog2();
	msg.analog3 = pkt.getAnalog3();
	msg.analog4 = pkt.getAnalog4();

	pub.publish(msg);

}
/**
 *
 * @param msg
 */
void AutopilotDriver::userActionCallback(
		const seagull_autopilot_msgs::AutopilotUserAction::ConstPtr& msg) {
	BYTE_VECTOR payload;
	Piccolo::SDK::Core::Packets::UserActionPacket pkt;
	pkt.setAction(msg->action);
	pkt.setOn(msg->on);
	pkt.toRaw(&payload);

	if (!commManager->SendAutopilotStreamPacket(
			Piccolo::SDK::Core::Packets::OI_ADDRESS, msg->header.vehicleId,
			Piccolo::SDK::Core::Packets::USER_ACTION, &payload)) {
		ROS_INFO("[AutopilotDriver] %s", "User Action request failed");
	} else {
		ROS_INFO("[AutopilotDriver] Action: %d On: %d %s", msg->action, msg->on,
				"User Action request done!");
	}

}
