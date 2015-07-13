// Generated by gencpp from file seagull_autopilot_msgs/AutopilotMissionLimits.msg
// DO NOT EDIT!


#ifndef SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTMISSIONLIMITS_H
#define SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTMISSIONLIMITS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <seagull_commons_msgs/SeagullHeader.h>

namespace seagull_autopilot_msgs
{
template <class ContainerAllocator>
struct AutopilotMissionLimits_
{
  typedef AutopilotMissionLimits_<ContainerAllocator> Type;

  AutopilotMissionLimits_()
    : header()
    , request(false)
    , comms_timeout(0)
    , pilot_timeout(0)
    , gps_timeout(0)
    , lost_comms_wp(0)
    , autoland_wp(0)
    , altitude_min(0)
    , altitude_max(0)
    , fligth_timeout(0)
    , failure0(0)
    , failure1(0)  {
    }
  AutopilotMissionLimits_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , request(false)
    , comms_timeout(0)
    , pilot_timeout(0)
    , gps_timeout(0)
    , lost_comms_wp(0)
    , autoland_wp(0)
    , altitude_min(0)
    , altitude_max(0)
    , fligth_timeout(0)
    , failure0(0)
    , failure1(0)  {
    }



   typedef  ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _request_type;
  _request_type request;

   typedef uint32_t _comms_timeout_type;
  _comms_timeout_type comms_timeout;

   typedef uint32_t _pilot_timeout_type;
  _pilot_timeout_type pilot_timeout;

   typedef uint32_t _gps_timeout_type;
  _gps_timeout_type gps_timeout;

   typedef uint8_t _lost_comms_wp_type;
  _lost_comms_wp_type lost_comms_wp;

   typedef uint8_t _autoland_wp_type;
  _autoland_wp_type autoland_wp;

   typedef int16_t _altitude_min_type;
  _altitude_min_type altitude_min;

   typedef int16_t _altitude_max_type;
  _altitude_max_type altitude_max;

   typedef uint32_t _fligth_timeout_type;
  _fligth_timeout_type fligth_timeout;

   typedef uint8_t _failure0_type;
  _failure0_type failure0;

   typedef uint8_t _failure1_type;
  _failure1_type failure1;




  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> const> ConstPtr;

}; // struct AutopilotMissionLimits_

typedef ::seagull_autopilot_msgs::AutopilotMissionLimits_<std::allocator<void> > AutopilotMissionLimits;

typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotMissionLimits > AutopilotMissionLimitsPtr;
typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotMissionLimits const> AutopilotMissionLimitsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace seagull_autopilot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'seagull_autopilot_msgs': ['/home/eloi/seagull_ws_dev/src/seagull_autopilot_msgs/msg'], 'seagull_commons_msgs': ['/home/eloi/seagull_ws_dev/src/seagull_commons_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "042de3fc3f4f9595eb380111ebfe2421";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x042de3fc3f4f9595ULL;
  static const uint64_t static_value2 = 0xeb380111ebfe2421ULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_autopilot_msgs/AutopilotMissionLimits";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeader header\n\
bool request\n\
uint32 comms_timeout\n\
uint32 pilot_timeout\n\
uint32 gps_timeout\n\
uint8 lost_comms_wp\n\
uint8 autoland_wp\n\
int16 altitude_min\n\
int16 altitude_max\n\
uint32 fligth_timeout\n\
uint8 failure0\n\
uint8 failure1\n\
================================================================================\n\
MSG: seagull_commons_msgs/SeagullHeader\n\
Header header\n\
uint16 vehicleId\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.request);
      stream.next(m.comms_timeout);
      stream.next(m.pilot_timeout);
      stream.next(m.gps_timeout);
      stream.next(m.lost_comms_wp);
      stream.next(m.autoland_wp);
      stream.next(m.altitude_min);
      stream.next(m.altitude_max);
      stream.next(m.fligth_timeout);
      stream.next(m.failure0);
      stream.next(m.failure1);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AutopilotMissionLimits_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_autopilot_msgs::AutopilotMissionLimits_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "request: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.request);
    s << indent << "comms_timeout: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.comms_timeout);
    s << indent << "pilot_timeout: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.pilot_timeout);
    s << indent << "gps_timeout: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.gps_timeout);
    s << indent << "lost_comms_wp: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.lost_comms_wp);
    s << indent << "autoland_wp: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.autoland_wp);
    s << indent << "altitude_min: ";
    Printer<int16_t>::stream(s, indent + "  ", v.altitude_min);
    s << indent << "altitude_max: ";
    Printer<int16_t>::stream(s, indent + "  ", v.altitude_max);
    s << indent << "fligth_timeout: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.fligth_timeout);
    s << indent << "failure0: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.failure0);
    s << indent << "failure1: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.failure1);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTMISSIONLIMITS_H
