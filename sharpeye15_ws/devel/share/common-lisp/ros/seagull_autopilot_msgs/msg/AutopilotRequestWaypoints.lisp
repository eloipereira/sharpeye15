; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotRequestWaypoints.msg.html

(cl:defclass <AutopilotRequestWaypoints> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader)))
)

(cl:defclass AutopilotRequestWaypoints (<AutopilotRequestWaypoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotRequestWaypoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotRequestWaypoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotRequestWaypoints> is deprecated: use seagull_autopilot_msgs-msg:AutopilotRequestWaypoints instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotRequestWaypoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotRequestWaypoints>) ostream)
  "Serializes a message object of type '<AutopilotRequestWaypoints>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotRequestWaypoints>) istream)
  "Deserializes a message object of type '<AutopilotRequestWaypoints>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotRequestWaypoints>)))
  "Returns string type for a message object of type '<AutopilotRequestWaypoints>"
  "seagull_autopilot_msgs/AutopilotRequestWaypoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotRequestWaypoints)))
  "Returns string type for a message object of type 'AutopilotRequestWaypoints"
  "seagull_autopilot_msgs/AutopilotRequestWaypoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotRequestWaypoints>)))
  "Returns md5sum for a message object of type '<AutopilotRequestWaypoints>"
  "8bfd618ea4ba888bfa009a9932fe8f4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotRequestWaypoints)))
  "Returns md5sum for a message object of type 'AutopilotRequestWaypoints"
  "8bfd618ea4ba888bfa009a9932fe8f4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotRequestWaypoints>)))
  "Returns full string definition for message of type '<AutopilotRequestWaypoints>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotRequestWaypoints)))
  "Returns full string definition for message of type 'AutopilotRequestWaypoints"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotRequestWaypoints>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotRequestWaypoints>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotRequestWaypoints
    (cl:cons ':header (header msg))
))
