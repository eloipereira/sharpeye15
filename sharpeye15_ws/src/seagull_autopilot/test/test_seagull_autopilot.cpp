// Bring in my package's API, which is what I'm testing

#include <vector>
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
#include <seagull_autopilot_msgs/AutopilotTelemetry.h>
#include <seagull_autopilot_msgs/AutopilotWPList.h>
#include <seagull_autopilot_msgs/AutopilotWaypoint.h>
#include <seagull_autopilot_msgs/AutopilotPayload.h>
#include <seagull_autopilot_msgs/AutopilotRequestWaypoints.h>
#include <seagull_autopilot/TopicsAndServices.h>


seagull_autopilot_msgs::AutopilotTelemetry gTelemetry;
seagull_autopilot_msgs::AutopilotPayload gPayload;
seagull_autopilot_msgs::AutopilotWPList gwpList;
seagull_autopilot_msgs::AutopilotWaypoint gWP;

std::vector<seagull_autopilot_msgs::AutopilotWaypoint> waypoints;

bool receivedTelemetry;
bool receivedOnBoardPayload;
bool receivedWPList;

class AutopilotDriverTest: public testing::Test
{
public:
protected:
	virtual void SetUp()
	{
		receivedTelemetry=false;
	}
	virtual void TearDown()
	{
	}
};
void TelemetryCallback(
		const seagull_autopilot_msgs::AutopilotTelemetry::ConstPtr& msg)
{
	gTelemetry = *msg;
	receivedTelemetry=true;
}
void FromPayloadCallback(
		const seagull_autopilot_msgs::AutopilotPayload::ConstPtr& msg)
{
	gPayload = *msg;
	receivedOnBoardPayload=true;
}

void WaypointCallback(
		const seagull_autopilot_msgs::AutopilotWaypoint::ConstPtr& msg)
{
	gWP = *msg;
	waypoints.push_back(*msg);
	ROS_INFO("Received Waypoint: %d",msg->index);
}
void WaypointListCallback(
		const seagull_autopilot_msgs::AutopilotWPList::ConstPtr& msg)
{
	gwpList = *msg;
	receivedWPList=true;
}

// Declare a test
TEST_F(AutopilotDriverTest, get_waypoints)
{
	ros::NodeHandle node;
	ros::Subscriber subWP = node.subscribe(
			seagull_autopilot::topics::AP_WAYPOINT_FROM_AP_TOPIC, 100,&WaypointCallback);
	ros::Subscriber subWPL = node.subscribe(
			seagull_autopilot::topics::AP_WP_LIST_FROM_AP_TOPIC, 10,&WaypointListCallback);

	ros::Rate r(10.0);
	while (subWP.getNumPublishers() == 0)
	{
		r.sleep();
	}

	ros::Publisher pubRequestWP = node.advertise<seagull_autopilot_msgs::AutopilotRequestWaypoints>(seagull_autopilot::topics::AP_REQUEST_WPS_TOPIC,10);
	seagull_autopilot_msgs::AutopilotRequestWaypoints m ;
	m.header.vehicleId=1;
	sleep(1);
	pubRequestWP.publish(m);

	ROS_INFO("Sent waypoint request");
	while (!receivedWPList)
	{
		ros::spinOnce();
		r.sleep();
	}
	for (int i = 0; i < gwpList.list.size(); ++i) {
		ROS_INFO("[%d]",gwpList.list[i]);
	}
	ASSERT_EQ( gwpList.list.size(),waypoints.size());
}




// Declare a test
TEST_F(AutopilotDriverTest, get_telemetry)
{

	ros::NodeHandle node;
	ros::Subscriber sub = node.subscribe(
			seagull_autopilot::topics::AP_TELEMETRY_TOPIC, 1,&TelemetryCallback);

	ros::Rate r(10.0);

	while (sub.getNumPublishers() == 0)
	{
		r.sleep();
	}
	while (!receivedTelemetry)
	{
		ros::spinOnce();
		r.sleep();
	}

	ASSERT_EQ(1, gTelemetry.header.vehicleId);
}
/**
TEST_F(AutopilotDriverTest, payload_stream_onboard)
{

	ros::NodeHandle node;
	ros::Subscriber sub = node.subscribe(
			seagull_autopilot::topics::AP_FROM_PAYLOAD_TOPIC, 1,&FromPayloadCallback);

	ros::Rate r(10.0);

	while (sub.getNumPublishers() == 0)
	{
		r.sleep();
	}
	while (!receivedOnBoardPayload)
	{
		ros::spinOnce();
		r.sleep();
	}

	ASSERT_EQ(1, gPayload.header.vehicleId);
}
*/


// Run all the tests that were declared with TEST()
int main(int argc, char **argv)
{
	ros::init(argc, argv, "test_seagull_autopilot");
	testing::InitGoogleTest(&argc, argv);

	return RUN_ALL_TESTS();
}


