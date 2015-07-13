// Generated by gencpp from file seagull_autopilot_msgs/AutopilotPayload.msg
// DO NOT EDIT!


#ifndef SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTPAYLOAD_H
#define SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTPAYLOAD_H


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
struct AutopilotPayload_
{
  typedef AutopilotPayload_<ContainerAllocator> Type;

  AutopilotPayload_()
    : header()
    , len(0)
    , data()  {
    }
  AutopilotPayload_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , len(0)
    , data(_alloc)  {
    }



   typedef  ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _len_type;
  _len_type len;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _data_type;
  _data_type data;




  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> const> ConstPtr;

}; // struct AutopilotPayload_

typedef ::seagull_autopilot_msgs::AutopilotPayload_<std::allocator<void> > AutopilotPayload;

typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotPayload > AutopilotPayloadPtr;
typedef boost::shared_ptr< ::seagull_autopilot_msgs::AutopilotPayload const> AutopilotPayloadConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "adb78e05c9cc6ce2e481f3c98b9ce89c";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xadb78e05c9cc6ce2ULL;
  static const uint64_t static_value2 = 0xe481f3c98b9ce89cULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_autopilot_msgs/AutopilotPayload";
  }

  static const char* value(const ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeader header\n\
uint32 len\n\
uint8[]  data\n\
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

  static const char* value(const ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.len);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AutopilotPayload_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_autopilot_msgs::AutopilotPayload_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "len: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.len);
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_AUTOPILOT_MSGS_MESSAGE_AUTOPILOTPAYLOAD_H
