"""autogenerated by genpy from seagull_autopilot_msgs/AutopilotStatus.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import seagull_commons_msgs.msg
import std_msgs.msg

class AutopilotStatus(genpy.Message):
  _md5sum = "ba6bd3a788b80b299ef58cd33c2e580f"
  _type = "seagull_autopilot_msgs/AutopilotStatus"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """seagull_commons_msgs/SeagullHeader header
uint8 orbitRadius
uint8 trackerStatus
uint16 timeToWp
uint8 wpFrom
uint8 wpTo
bool airBoundaryViolated
bool autopilotEngineKill
bool commsTimeout
bool fligthTimerElapsed
bool fligthTermination
bool gpsTimeout
bool orbiting
uint8 loopControl1
uint8 loopControl2
uint8 loopControl3
uint8 loopControl4
uint8 loopControl5
uint8 loopControl6
uint8 loopControl7
uint8 loopControl8
uint8 loopControlCount
	uint8 STATUS_OFF=0
	uint8 STATUS_ON=1
	uint8 STATUS_AUTO=2
bool userAction0
bool userAction1
bool userAction2
bool userAction3
bool userAction4
bool userAction5
bool userAction6
bool userAction7
uint16 elapsedTime

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
  # Pseudo-constants
  STATUS_OFF = 0
  STATUS_ON = 1
  STATUS_AUTO = 2

  __slots__ = ['header','orbitRadius','trackerStatus','timeToWp','wpFrom','wpTo','airBoundaryViolated','autopilotEngineKill','commsTimeout','fligthTimerElapsed','fligthTermination','gpsTimeout','orbiting','loopControl1','loopControl2','loopControl3','loopControl4','loopControl5','loopControl6','loopControl7','loopControl8','loopControlCount','userAction0','userAction1','userAction2','userAction3','userAction4','userAction5','userAction6','userAction7','elapsedTime']
  _slot_types = ['seagull_commons_msgs/SeagullHeader','uint8','uint8','uint16','uint8','uint8','bool','bool','bool','bool','bool','bool','bool','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','uint8','bool','bool','bool','bool','bool','bool','bool','bool','uint16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,orbitRadius,trackerStatus,timeToWp,wpFrom,wpTo,airBoundaryViolated,autopilotEngineKill,commsTimeout,fligthTimerElapsed,fligthTermination,gpsTimeout,orbiting,loopControl1,loopControl2,loopControl3,loopControl4,loopControl5,loopControl6,loopControl7,loopControl8,loopControlCount,userAction0,userAction1,userAction2,userAction3,userAction4,userAction5,userAction6,userAction7,elapsedTime

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AutopilotStatus, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = seagull_commons_msgs.msg.SeagullHeader()
      if self.orbitRadius is None:
        self.orbitRadius = 0
      if self.trackerStatus is None:
        self.trackerStatus = 0
      if self.timeToWp is None:
        self.timeToWp = 0
      if self.wpFrom is None:
        self.wpFrom = 0
      if self.wpTo is None:
        self.wpTo = 0
      if self.airBoundaryViolated is None:
        self.airBoundaryViolated = False
      if self.autopilotEngineKill is None:
        self.autopilotEngineKill = False
      if self.commsTimeout is None:
        self.commsTimeout = False
      if self.fligthTimerElapsed is None:
        self.fligthTimerElapsed = False
      if self.fligthTermination is None:
        self.fligthTermination = False
      if self.gpsTimeout is None:
        self.gpsTimeout = False
      if self.orbiting is None:
        self.orbiting = False
      if self.loopControl1 is None:
        self.loopControl1 = 0
      if self.loopControl2 is None:
        self.loopControl2 = 0
      if self.loopControl3 is None:
        self.loopControl3 = 0
      if self.loopControl4 is None:
        self.loopControl4 = 0
      if self.loopControl5 is None:
        self.loopControl5 = 0
      if self.loopControl6 is None:
        self.loopControl6 = 0
      if self.loopControl7 is None:
        self.loopControl7 = 0
      if self.loopControl8 is None:
        self.loopControl8 = 0
      if self.loopControlCount is None:
        self.loopControlCount = 0
      if self.userAction0 is None:
        self.userAction0 = False
      if self.userAction1 is None:
        self.userAction1 = False
      if self.userAction2 is None:
        self.userAction2 = False
      if self.userAction3 is None:
        self.userAction3 = False
      if self.userAction4 is None:
        self.userAction4 = False
      if self.userAction5 is None:
        self.userAction5 = False
      if self.userAction6 is None:
        self.userAction6 = False
      if self.userAction7 is None:
        self.userAction7 = False
      if self.elapsedTime is None:
        self.elapsedTime = 0
    else:
      self.header = seagull_commons_msgs.msg.SeagullHeader()
      self.orbitRadius = 0
      self.trackerStatus = 0
      self.timeToWp = 0
      self.wpFrom = 0
      self.wpTo = 0
      self.airBoundaryViolated = False
      self.autopilotEngineKill = False
      self.commsTimeout = False
      self.fligthTimerElapsed = False
      self.fligthTermination = False
      self.gpsTimeout = False
      self.orbiting = False
      self.loopControl1 = 0
      self.loopControl2 = 0
      self.loopControl3 = 0
      self.loopControl4 = 0
      self.loopControl5 = 0
      self.loopControl6 = 0
      self.loopControl7 = 0
      self.loopControl8 = 0
      self.loopControlCount = 0
      self.userAction0 = False
      self.userAction1 = False
      self.userAction2 = False
      self.userAction3 = False
      self.userAction4 = False
      self.userAction5 = False
      self.userAction6 = False
      self.userAction7 = False
      self.elapsedTime = 0

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
      buff.write(_struct_H2BH26BH.pack(_x.header.vehicleId, _x.orbitRadius, _x.trackerStatus, _x.timeToWp, _x.wpFrom, _x.wpTo, _x.airBoundaryViolated, _x.autopilotEngineKill, _x.commsTimeout, _x.fligthTimerElapsed, _x.fligthTermination, _x.gpsTimeout, _x.orbiting, _x.loopControl1, _x.loopControl2, _x.loopControl3, _x.loopControl4, _x.loopControl5, _x.loopControl6, _x.loopControl7, _x.loopControl8, _x.loopControlCount, _x.userAction0, _x.userAction1, _x.userAction2, _x.userAction3, _x.userAction4, _x.userAction5, _x.userAction6, _x.userAction7, _x.elapsedTime))
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
      (_x.header.vehicleId, _x.orbitRadius, _x.trackerStatus, _x.timeToWp, _x.wpFrom, _x.wpTo, _x.airBoundaryViolated, _x.autopilotEngineKill, _x.commsTimeout, _x.fligthTimerElapsed, _x.fligthTermination, _x.gpsTimeout, _x.orbiting, _x.loopControl1, _x.loopControl2, _x.loopControl3, _x.loopControl4, _x.loopControl5, _x.loopControl6, _x.loopControl7, _x.loopControl8, _x.loopControlCount, _x.userAction0, _x.userAction1, _x.userAction2, _x.userAction3, _x.userAction4, _x.userAction5, _x.userAction6, _x.userAction7, _x.elapsedTime,) = _struct_H2BH26BH.unpack(str[start:end])
      self.airBoundaryViolated = bool(self.airBoundaryViolated)
      self.autopilotEngineKill = bool(self.autopilotEngineKill)
      self.commsTimeout = bool(self.commsTimeout)
      self.fligthTimerElapsed = bool(self.fligthTimerElapsed)
      self.fligthTermination = bool(self.fligthTermination)
      self.gpsTimeout = bool(self.gpsTimeout)
      self.orbiting = bool(self.orbiting)
      self.userAction0 = bool(self.userAction0)
      self.userAction1 = bool(self.userAction1)
      self.userAction2 = bool(self.userAction2)
      self.userAction3 = bool(self.userAction3)
      self.userAction4 = bool(self.userAction4)
      self.userAction5 = bool(self.userAction5)
      self.userAction6 = bool(self.userAction6)
      self.userAction7 = bool(self.userAction7)
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
      buff.write(_struct_H2BH26BH.pack(_x.header.vehicleId, _x.orbitRadius, _x.trackerStatus, _x.timeToWp, _x.wpFrom, _x.wpTo, _x.airBoundaryViolated, _x.autopilotEngineKill, _x.commsTimeout, _x.fligthTimerElapsed, _x.fligthTermination, _x.gpsTimeout, _x.orbiting, _x.loopControl1, _x.loopControl2, _x.loopControl3, _x.loopControl4, _x.loopControl5, _x.loopControl6, _x.loopControl7, _x.loopControl8, _x.loopControlCount, _x.userAction0, _x.userAction1, _x.userAction2, _x.userAction3, _x.userAction4, _x.userAction5, _x.userAction6, _x.userAction7, _x.elapsedTime))
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
      (_x.header.vehicleId, _x.orbitRadius, _x.trackerStatus, _x.timeToWp, _x.wpFrom, _x.wpTo, _x.airBoundaryViolated, _x.autopilotEngineKill, _x.commsTimeout, _x.fligthTimerElapsed, _x.fligthTermination, _x.gpsTimeout, _x.orbiting, _x.loopControl1, _x.loopControl2, _x.loopControl3, _x.loopControl4, _x.loopControl5, _x.loopControl6, _x.loopControl7, _x.loopControl8, _x.loopControlCount, _x.userAction0, _x.userAction1, _x.userAction2, _x.userAction3, _x.userAction4, _x.userAction5, _x.userAction6, _x.userAction7, _x.elapsedTime,) = _struct_H2BH26BH.unpack(str[start:end])
      self.airBoundaryViolated = bool(self.airBoundaryViolated)
      self.autopilotEngineKill = bool(self.autopilotEngineKill)
      self.commsTimeout = bool(self.commsTimeout)
      self.fligthTimerElapsed = bool(self.fligthTimerElapsed)
      self.fligthTermination = bool(self.fligthTermination)
      self.gpsTimeout = bool(self.gpsTimeout)
      self.orbiting = bool(self.orbiting)
      self.userAction0 = bool(self.userAction0)
      self.userAction1 = bool(self.userAction1)
      self.userAction2 = bool(self.userAction2)
      self.userAction3 = bool(self.userAction3)
      self.userAction4 = bool(self.userAction4)
      self.userAction5 = bool(self.userAction5)
      self.userAction6 = bool(self.userAction6)
      self.userAction7 = bool(self.userAction7)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_H2BH26BH = struct.Struct("<H2BH26BH")
