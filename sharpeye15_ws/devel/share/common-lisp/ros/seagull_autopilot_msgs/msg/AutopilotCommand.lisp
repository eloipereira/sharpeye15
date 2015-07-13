; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotCommand.msg.html

(cl:defclass <AutopilotCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (command_code
    :reader command_code
    :initarg :command_code
    :type cl:fixnum
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass AutopilotCommand (<AutopilotCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotCommand> is deprecated: use seagull_autopilot_msgs-msg:AutopilotCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'command_code-val :lambda-list '(m))
(cl:defmethod command_code-val ((m <AutopilotCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:command_code-val is deprecated.  Use seagull_autopilot_msgs-msg:command_code instead.")
  (command_code m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <AutopilotCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:value-val is deprecated.  Use seagull_autopilot_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AutopilotCommand>)))
    "Constants for message type '<AutopilotCommand>"
  '((:CC_IAS . 0)
    (:CC_ALTITUDE . 1)
    (:CC_BANK . 2)
    (:CC_FLAPS . 3)
    (:CC_HEADING . 4)
    (:CC_VRATE . 5)
    (:CC_PITCH . 6))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AutopilotCommand)))
    "Constants for message type 'AutopilotCommand"
  '((:CC_IAS . 0)
    (:CC_ALTITUDE . 1)
    (:CC_BANK . 2)
    (:CC_FLAPS . 3)
    (:CC_HEADING . 4)
    (:CC_VRATE . 5)
    (:CC_PITCH . 6))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotCommand>) ostream)
  "Serializes a message object of type '<AutopilotCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'command_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotCommand>) istream)
  "Deserializes a message object of type '<AutopilotCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command_code) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotCommand>)))
  "Returns string type for a message object of type '<AutopilotCommand>"
  "seagull_autopilot_msgs/AutopilotCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotCommand)))
  "Returns string type for a message object of type 'AutopilotCommand"
  "seagull_autopilot_msgs/AutopilotCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotCommand>)))
  "Returns md5sum for a message object of type '<AutopilotCommand>"
  "4f25469437cb929b6c9e1a00cd8f89d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotCommand)))
  "Returns md5sum for a message object of type 'AutopilotCommand"
  "4f25469437cb929b6c9e1a00cd8f89d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotCommand>)))
  "Returns full string definition for message of type '<AutopilotCommand>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 command_code~%    uint8 CC_IAS=0~%    uint8 CC_ALTITUDE=1~%    uint8 CC_BANK=2~%    uint8 CC_FLAPS=3~%    uint8 CC_HEADING=4~%    uint8 CC_VRATE=5~%    uint8 CC_PITCH=6~%float32 value~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotCommand)))
  "Returns full string definition for message of type 'AutopilotCommand"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 command_code~%    uint8 CC_IAS=0~%    uint8 CC_ALTITUDE=1~%    uint8 CC_BANK=2~%    uint8 CC_FLAPS=3~%    uint8 CC_HEADING=4~%    uint8 CC_VRATE=5~%    uint8 CC_PITCH=6~%float32 value~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotCommand
    (cl:cons ':header (header msg))
    (cl:cons ':command_code (command_code msg))
    (cl:cons ':value (value msg))
))
