// Generated by gencpp from file seagull_autopilot_msgs/AutopilotZeroLength.msg
// DO NOT EDIT!


#ifndef SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTZEROLENGTH_H
#define SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTZEROLENGTH_H


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
struct AutopilotZeroLength_
{
  typedef AutopilotZeroLength_<ContainerAllocator> Type;

  AutopilotZeroLength_()
    : header()
    , messageType(0)  {
    }
  AutopilotZeroLength_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , messageType(0)  {
    }



   typedef  ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int8_t _messageType_type;
  _messageType_type messageType;




  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> const> ConstPtr;

}; // struct AutopilotZeroLength_

typedef ::seagull_autopilot_msgs::AutopilotZeroLength_<std::allocator<void> > AutopilotZeroLength;

typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotZeroLength > AutopilotZeroLengthPtr;
typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotZeroLength const> AutopilotZeroLengthConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace seagull_autopilot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'seagull_autopilot_msgs': ['/home/ciafa/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg'], 'seagull_commons_msgs': ['/home/ciafa/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
{
  static const char* value()
  {
    return "09b8db8e6651718203e06a19f8bc5110";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x09b8db8e66517182ULL;
  static const uint64_t static_value2 = 0x03e06a19f8bc5110ULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_autopilot_msgs/AutopilotZeroLength";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeader header\n\
int8 messageType\n\
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

  static const char* value(const ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.messageType);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AutopilotZeroLength_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_autopilot_msgs::AutopilotZeroLength_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "messageType: ";
    Printer<int8_t>::stream(s, indent + "  ", v.messageType);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTZEROLENGTH_H
