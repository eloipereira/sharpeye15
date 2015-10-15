// Generated by gencpp from file seagull_commons_msgs/SeagullError.msg
// DO NOT EDIT!


#ifndef SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLERROR_H
#define SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLERROR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace seagull_commons_msgs
{
template <class ContainerAllocator>
struct SeagullError_
{
  typedef SeagullError_<ContainerAllocator> Type;

  SeagullError_()
    : header()
    , errorType(0)
    , errorNode(0)
    , errorMsg()  {
    }
  SeagullError_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , errorType(0)
    , errorNode(0)
    , errorMsg(_alloc)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _errorType_type;
  _errorType_type errorType;

   typedef uint8_t _errorNode_type;
  _errorNode_type errorNode;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _errorMsg_type;
  _errorMsg_type errorMsg;




  typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> const> ConstPtr;

}; // struct SeagullError_

typedef ::seagull_commons_msgs::SeagullError_<std::allocator<void> > SeagullError;

typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullError > SeagullErrorPtr;
typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullError const> SeagullErrorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_commons_msgs::SeagullError_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace seagull_commons_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'seagull_commons_msgs': ['/home/administrator/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
{
  static const char* value()
  {
    return "179220cff18c069f6ad64fcdd63e1eea";
  }

  static const char* value(const ::seagull_commons_msgs::SeagullError_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x179220cff18c069fULL;
  static const uint64_t static_value2 = 0x6ad64fcdd63e1eeaULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullError";
  }

  static const char* value(const ::seagull_commons_msgs::SeagullError_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
uint8 errorType\n\
uint8 errorNode\n\
string errorMsg\n\
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

  static const char* value(const ::seagull_commons_msgs::SeagullError_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.errorType);
      stream.next(m.errorNode);
      stream.next(m.errorMsg);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SeagullError_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_commons_msgs::SeagullError_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_commons_msgs::SeagullError_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "errorType: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.errorType);
    s << indent << "errorNode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.errorNode);
    s << indent << "errorMsg: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.errorMsg);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLERROR_H
