// Generated by gencpp from file seagull_commons_msgs/SeagullHeartbeat.msg
// DO NOT EDIT!


#ifndef SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLHEARTBEAT_H
#define SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLHEARTBEAT_H


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
struct SeagullHeartbeat_
{
  typedef SeagullHeartbeat_<ContainerAllocator> Type;

  SeagullHeartbeat_()
    : header()
    , node(0)  {
    }
  SeagullHeartbeat_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , node(0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _node_type;
  _node_type node;


    enum { HB_AIS_DRIVER = 0u };
     enum { HB_GOBI_FG = 1u };
     enum { HB_JAI_FG = 2u };
     enum { HB_TASE_FG = 3u };
     enum { HB_DETECTION_MODULE = 4u };
     enum { HB_SEAGULL_MANAGER = 5u };
     enum { HB_TASE_DRIVER = 6u };
     enum { HB_TASE_COMMS = 7u };
     enum { HB_COMMS_RELAY = 8u };
     enum { HB_AP_DRIVER = 9u };
     enum { HB_AP_COMMS = 10u };
     enum { HB_CONTROL_SUPERVISOR = 11u };
     enum { HB_TARGET_TRACKING = 12u };
     enum { HB_SENSE_AVOID = 13u };
     enum { HB_ADSB_DRIVER = 14u };
 

  typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> const> ConstPtr;

}; // struct SeagullHeartbeat_

typedef ::seagull_commons_msgs::SeagullHeartbeat_<std::allocator<void> > SeagullHeartbeat;

typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullHeartbeat > SeagullHeartbeatPtr;
typedef boost::shared_ptr< ::seagull_commons_msgs::SeagullHeartbeat const> SeagullHeartbeatConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace seagull_commons_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'seagull_commons_msgs': ['/home/eloi/seagull_ws_dev/src/seagull_commons_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "62b94c14302d5b1cb99c74aba1c738c4";
  }

  static const char* value(const ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x62b94c14302d5b1cULL;
  static const uint64_t static_value2 = 0xb99c74aba1c738c4ULL;
};

template<class ContainerAllocator>
struct DataType< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "seagull_commons_msgs/SeagullHeartbeat";
  }

  static const char* value(const ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
uint8 node\n\
      uint8 HB_AIS_DRIVER=0\n\
      uint8 HB_GOBI_FG=1\n\
      uint8 HB_JAI_FG=2\n\
      uint8 HB_TASE_FG=3\n\
      uint8 HB_DETECTION_MODULE=4\n\
      uint8 HB_SEAGULL_MANAGER=5\n\
      uint8 HB_TASE_DRIVER=6\n\
      uint8 HB_TASE_COMMS=7      \n\
      uint8 HB_COMMS_RELAY=8\n\
      uint8 HB_AP_DRIVER=9\n\
      uint8 HB_AP_COMMS=10\n\
      uint8 HB_CONTROL_SUPERVISOR=11\n\
      uint8 HB_TARGET_TRACKING=12\n\
      uint8 HB_SENSE_AVOID=13\n\
      uint8 HB_ADSB_DRIVER=14\n\
      \n\
      \n\
\n\
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

  static const char* value(const ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.node);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SeagullHeartbeat_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::seagull_commons_msgs::SeagullHeartbeat_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "node: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.node);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEAGULL_COMMONS_MSGS_MESSAGE_SEAGULLHEARTBEAT_H
