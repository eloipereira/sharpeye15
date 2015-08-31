"""autogenerated by genpy from seagull_autopilot_msgs/AutopilotMissionLimits.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import seagull_commons_msgs.msg
import std_msgs.msg

class AutopilotMissionLimits(genpy.Message):
  _md5sum = "042de3fc3f4f9595eb380111ebfe2421"
  _type = "seagull_autopilot_msgs/AutopilotMissionLimits"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """seagull_commons_msgs/SeagullHeader header
bool request
uint32 comms_timeout
uint32 pilot_timeout
uint32 gps_timeout
uint8 lost_comms_wp
uint8 autoland_wp
int16 altitude_min
int16 altitude_max
uint32 fligth_timeout
uint8 failure0
uint8 failure1
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
  __slots__ = ['header','request','comms_timeout','pilot_timeout','gps_timeout','lost_comms_wp','autoland_wp','altitude_min','altitude_max','fligth_timeout','failure0','failure1']
  _slot_types = ['seagull_commons_msgs/SeagullHeader','bool','uint32','uint32','uint32','uint8','uint8','int16','int16','uint32','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,request,comms_timeout,pilot_timeout,gps_timeout,lost_comms_wp,autoland_wp,altitude_min,altitude_max,fligth_timeout,failure0,failure1

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AutopilotMissionLimits, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = seagull_commons_msgs.msg.SeagullHeader()
      if self.request is None:
        self.request = False
      if self.comms_timeout is None:
        self.comms_timeout = 0
      if self.pilot_timeout is None:
        self.pilot_timeout = 0
      if self.gps_timeout is None:
        self.gps_timeout = 0
      if self.lost_comms_wp is None:
        self.lost_comms_wp = 0
      if self.autoland_wp is None:
        self.autoland_wp = 0
      if self.altitude_min is None:
        self.altitude_min = 0
      if self.altitude_max is None:
        self.altitude_max = 0
      if self.fligth_timeout is None:
        self.fligth_timeout = 0
      if self.failure0 is None:
        self.failure0 = 0
      if self.failure1 is None:
        self.failure1 = 0
    else:
      self.header = seagull_commons_msgs.msg.SeagullHeader()
      self.request = False
      self.comms_timeout = 0
      self.pilot_timeout = 0
      self.gps_timeout = 0
      self.lost_comms_wp = 0
      self.autoland_wp = 0
      self.altitude_min = 0
      self.altitude_max = 0
      self.fligth_timeout = 0
      self.failure0 = 0
      self.failure1 = 0

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
      buff.write(_struct_HB3I2B2hI2B.pack(_x.header.vehicleId, _x.request, _x.comms_timeout, _x.pilot_timeout, _x.gps_timeout, _x.lost_comms_wp, _x.autoland_wp, _x.altitude_min, _x.altitude_max, _x.fligth_timeout, _x.failure0, _x.failure1))
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
      end += 27
      (_x.header.vehicleId, _x.request, _x.comms_timeout, _x.pilot_timeout, _x.gps_timeout, _x.lost_comms_wp, _x.autoland_wp, _x.altitude_min, _x.altitude_max, _x.fligth_timeout, _x.failure0, _x.failure1,) = _struct_HB3I2B2hI2B.unpack(str[start:end])
      self.request = bool(self.request)
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
      buff.write(_struct_HB3I2B2hI2B.pack(_x.header.vehicleId, _x.request, _x.comms_timeout, _x.pilot_timeout, _x.gps_timeout, _x.lost_comms_wp, _x.autoland_wp, _x.altitude_min, _x.altitude_max, _x.fligth_timeout, _x.failure0, _x.failure1))
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
      end += 27
      (_x.header.vehicleId, _x.request, _x.comms_timeout, _x.pilot_timeout, _x.gps_timeout, _x.lost_comms_wp, _x.autoland_wp, _x.altitude_min, _x.altitude_max, _x.fligth_timeout, _x.failure0, _x.failure1,) = _struct_HB3I2B2hI2B.unpack(str[start:end])
      self.request = bool(self.request)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3I = struct.Struct("<3I")
_struct_HB3I2B2hI2B = struct.Struct("<HB3I2B2hI2B")