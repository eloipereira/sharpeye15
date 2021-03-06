"""autogenerated by genpy from seagull_autopilot_msgs/AutopilotWaypoint.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import seagull_commons_msgs.msg
import std_msgs.msg

class AutopilotWaypoint(genpy.Message):
  _md5sum = "313cc62935d4d7749566850960081131"
  _type = "seagull_autopilot_msgs/AutopilotWaypoint"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """seagull_commons_msgs/SeagullHeader header
float32 latitude
float32 longitude
bool deployParachute
bool deployDrop
bool orbitDirection
bool cameraTarget
bool landingPoint
bool slopeControl
bool lightsOn
bool preTurn
uint8 orbitRadius
float32 altitude
uint8 windFind
uint8 orbitTime
uint8 index
uint8 next
uint8 user
bool orbitAbove
bool orbitBelow
bool hoverPoint
bool altitudeToGround
bool orbitMultiplier50
uint8 altLSB
================================================================================
MSG: seagull_commons_msgs/SeagullHeader
Header header
uint16 vehicleId
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

"""
  __slots__ = ['header','latitude','longitude','deployParachute','deployDrop','orbitDirection','cameraTarget','landingPoint','slopeControl','lightsOn','preTurn','orbitRadius','altitude','windFind','orbitTime','index','next','user','orbitAbove','orbitBelow','hoverPoint','altitudeToGround','orbitMultiplier50','altLSB']
  _slot_types = ['seagull_commons_msgs/SeagullHeader','float32','float32','bool','bool','bool','bool','bool','bool','bool','bool','uint8','float32','uint8','uint8','uint8','uint8','uint8','bool','bool','bool','bool','bool','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,latitude,longitude,deployParachute,deployDrop,orbitDirection,cameraTarget,landingPoint,slopeControl,lightsOn,preTurn,orbitRadius,altitude,windFind,orbitTime,index,next,user,orbitAbove,orbitBelow,hoverPoint,altitudeToGround,orbitMultiplier50,altLSB

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AutopilotWaypoint, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = seagull_commons_msgs.msg.SeagullHeader()
      if self.latitude is None:
        self.latitude = 0.
      if self.longitude is None:
        self.longitude = 0.
      if self.deployParachute is None:
        self.deployParachute = False
      if self.deployDrop is None:
        self.deployDrop = False
      if self.orbitDirection is None:
        self.orbitDirection = False
      if self.cameraTarget is None:
        self.cameraTarget = False
      if self.landingPoint is None:
        self.landingPoint = False
      if self.slopeControl is None:
        self.slopeControl = False
      if self.lightsOn is None:
        self.lightsOn = False
      if self.preTurn is None:
        self.preTurn = False
      if self.orbitRadius is None:
        self.orbitRadius = 0
      if self.altitude is None:
        self.altitude = 0.
      if self.windFind is None:
        self.windFind = 0
      if self.orbitTime is None:
        self.orbitTime = 0
      if self.index is None:
        self.index = 0
      if self.next is None:
        self.next = 0
      if self.user is None:
        self.user = 0
      if self.orbitAbove is None:
        self.orbitAbove = False
      if self.orbitBelow is None:
        self.orbitBelow = False
      if self.hoverPoint is None:
        self.hoverPoint = False
      if self.altitudeToGround is None:
        self.altitudeToGround = False
      if self.orbitMultiplier50 is None:
        self.orbitMultiplier50 = False
      if self.altLSB is None:
        self.altLSB = 0
    else:
      self.header = seagull_commons_msgs.msg.SeagullHeader()
      self.latitude = 0.
      self.longitude = 0.
      self.deployParachute = False
      self.deployDrop = False
      self.orbitDirection = False
      self.cameraTarget = False
      self.landingPoint = False
      self.slopeControl = False
      self.lightsOn = False
      self.preTurn = False
      self.orbitRadius = 0
      self.altitude = 0.
      self.windFind = 0
      self.orbitTime = 0
      self.index = 0
      self.next = 0
      self.user = 0
      self.orbitAbove = False
      self.orbitBelow = False
      self.hoverPoint = False
      self.altitudeToGround = False
      self.orbitMultiplier50 = False
      self.altLSB = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.header.seq, _x.header.header.stamp.secs, _x.header.header.stamp.nsecs))
      _x = self.header.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_H2f9Bf11B.pack(_x.header.vehicleId, _x.latitude, _x.longitude, _x.deployParachute, _x.deployDrop, _x.orbitDirection, _x.cameraTarget, _x.landingPoint, _x.slopeControl, _x.lightsOn, _x.preTurn, _x.orbitRadius, _x.altitude, _x.windFind, _x.orbitTime, _x.index, _x.next, _x.user, _x.orbitAbove, _x.orbitBelow, _x.hoverPoint, _x.altitudeToGround, _x.orbitMultiplier50, _x.altLSB))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = seagull_commons_msgs.msg.SeagullHeader()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.header.seq, _x.header.header.stamp.secs, _x.header.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 34
      (_x.header.vehicleId, _x.latitude, _x.longitude, _x.deployParachute, _x.deployDrop, _x.orbitDirection, _x.cameraTarget, _x.landingPoint, _x.slopeControl, _x.lightsOn, _x.preTurn, _x.orbitRadius, _x.altitude, _x.windFind, _x.orbitTime, _x.index, _x.next, _x.user, _x.orbitAbove, _x.orbitBelow, _x.hoverPoint, _x.altitudeToGround, _x.orbitMultiplier50, _x.altLSB,) = _struct_H2f9Bf11B.unpack(str[start:end])
      self.deployParachute = bool(self.deployParachute)
      self.deployDrop = bool(self.deployDrop)
      self.orbitDirection = bool(self.orbitDirection)
      self.cameraTarget = bool(self.cameraTarget)
      self.landingPoint = bool(self.landingPoint)
      self.slopeControl = bool(self.slopeControl)
      self.lightsOn = bool(self.lightsOn)
      self.preTurn = bool(self.preTurn)
      self.orbitAbove = bool(self.orbitAbove)
      self.orbitBelow = bool(self.orbitBelow)
      self.hoverPoint = bool(self.hoverPoint)
      self.altitudeToGround = bool(self.altitudeToGround)
      self.orbitMultiplier50 = bool(self.orbitMultiplier50)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.header.seq, _x.header.header.stamp.secs, _x.header.header.stamp.nsecs))
      _x = self.header.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_H2f9Bf11B.pack(_x.header.vehicleId, _x.latitude, _x.longitude, _x.deployParachute, _x.deployDrop, _x.orbitDirection, _x.cameraTarget, _x.landingPoint, _x.slopeControl, _x.lightsOn, _x.preTurn, _x.orbitRadius, _x.altitude, _x.windFind, _x.orbitTime, _x.index, _x.next, _x.user, _x.orbitAbove, _x.orbitBelow, _x.hoverPoint, _x.altitudeToGround, _x.orbitMultiplier50, _x.altLSB))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = seagull_commons_msgs.msg.SeagullHeader()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.header.seq, _x.header.header.stamp.secs, _x.header.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 34
      (_x.header.vehicleId, _x.latitude, _x.longitude, _x.deployParachute, _x.deployDrop, _x.orbitDirection, _x.cameraTarget, _x.landingPoint, _x.slopeControl, _x.lightsOn, _x.preTurn, _x.orbitRadius, _x.altitude, _x.windFind, _x.orbitTime, _x.index, _x.next, _x.user, _x.orbitAbove, _x.orbitBelow, _x.hoverPoint, _x.altitudeToGround, _x.orbitMultiplier50, _x.altLSB,) = _struct_H2f9Bf11B.unpack(str[start:end])
      self.deployParachute = bool(self.deployParachute)
      self.deployDrop = bool(self.deployDrop)
      self.orbitDirection = bool(self.orbitDirection)
      self.cameraTarget = bool(self.cameraTarget)
      self.landingPoint = bool(self.landingPoint)
      self.slopeControl = bool(self.slopeControl)
      self.lightsOn = bool(self.lightsOn)
      self.preTurn = bool(self.preTurn)
      self.orbitAbove = bool(self.orbitAbove)
      self.orbitBelow = bool(self.orbitBelow)
      self.hoverPoint = bool(self.hoverPoint)
      self.altitudeToGround = bool(self.altitudeToGround)
      self.orbitMultiplier50 = bool(self.orbitMultiplier50)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_H2f9Bf11B = struct.Struct("<H2f9Bf11B")
