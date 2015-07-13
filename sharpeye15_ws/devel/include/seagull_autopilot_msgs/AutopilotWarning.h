// Generated by gencpp from file seagull_autopilot_msgs/AutopilotWarning.msg
// DO NOT EDIT!


#ifndef SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTWARNING_H
#define SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTWARNING_H


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
struct AutopilotWarning_
{
  typedef AutopilotWarning_<ContainerAllocator> Type;

  AutopilotWarning_()
    : header()
    , command(0)
    , code(0)
    , message()  {
    }
  AutopilotWarning_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , command(0)
    , code(0)
    , message(_alloc)  {
    }



   typedef  ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _command_type;
  _command_type command;

   typedef uint8_t _code_type;
  _code_type code;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type;
  _message_type message;




  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> const> ConstPtr;

}; // struct AutopilotWarning_

typedef ::seagull_autopilot_msgs::AutopilotWarning_<std::allocator<void> > AutopilotWarning;

typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotWarning > AutopilotWarningPtr;
typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotWarning const> AutopilotWarningConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2df7c3cdabb7bcdfc754ce5b420bfa80";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2df7c3cdabb7bcdfULL;
  static const uint64_t static_value2 = 0xc754ce5b420bfa80ULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_autopilot_msgs/AutopilotWarning";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeader header\n\
uint8 command\n\
uint8 code\n\
string message\n\
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

  static const char* value(const ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.command);
      stream.next(m.code);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AutopilotWarning_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_autopilot_msgs::AutopilotWarning_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "command: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.command);
    s << indent << "code: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.code);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTWARNING_H
