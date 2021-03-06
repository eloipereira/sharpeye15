// Generated by gencpp from file seagull_communication_msgs/SeagullPayload.msg
// DO NOT EDIT!


#ifndef SEAGULL_COMMUNICATION_MSGS_MESSAGE_SEAGULLPAYLOAD_H
#define SEAGULL_COMMUNICATION_MSGS_MESSAGE_SEAGULLPAYLOAD_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <seagull_commons_msgs/SeagullHeader.h>

namespace seagull_communication_msgs
{
template <class ContainerAllocator>
struct SeagullPayload_
{
  typedef SeagullPayload_<ContainerAllocator> Type;

  SeagullPayload_()
    : header()
    , requiresAck(false)
    , length(0)
    , data()  {
    }
  SeagullPayload_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , requiresAck(false)
    , length(0)
    , data(_alloc)  {
    }



   typedef  ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _requiresAck_type;
  _requiresAck_type requiresAck;

   typedef uint32_t _length_type;
  _length_type length;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _data_type;
  _data_type data;




  typedef boost::shared_ptr< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> const> ConstPtr;

}; // struct SeagullPayload_

typedef ::seagull_communication_msgs::SeagullPayload_<std::allocator<void> > SeagullPayload;

typedef boost::shared_ptr< ::seagull_communication_msgs::SeagullPayload > SeagullPayloadPtr;
typedef boost::shared_ptr< ::seagull_communication_msgs::SeagullPayload const> SeagullPayloadConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace seagull_communication_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'seagull_commons_msgs': ['/home/ciafa/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'seagull_communication_msgs': ['/home/ciafa/sharpeye15/sharpeye15_ws/src/seagull_communication_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7c3ace7751a703b22cc8a80bfc815e64";
  }

  static const char* value(const ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7c3ace7751a703b2ULL;
  static const uint64_t static_value2 = 0x2cc8a80bfc815e64ULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_communication_msgs/SeagullPayload";
  }

  static const char* value(const ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeader header\n\
bool requiresAck\n\
uint32 length\n\
uint8[] data  \n\
\n\
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

  static const char* value(const ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.requiresAck);
      stream.next(m.length);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SeagullPayload_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_communication_msgs::SeagullPayload_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::seagull_commons_msgs::SeagullHeader_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "requiresAck: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.requiresAck);
    s << indent << "length: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.length);
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

#endif // SEAGULL_COMMUNICATION_MSGS_MESSAGE_SEAGULLPAYLOAD_H
