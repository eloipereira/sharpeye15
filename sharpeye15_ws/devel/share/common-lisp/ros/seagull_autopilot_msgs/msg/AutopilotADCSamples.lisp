; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotADCSamples.msg.html

(cl:defclass <AutopilotADCSamples> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (analog1
    :reader analog1
    :initarg :analog1
    :type cl:float
    :initform 0.0)
   (analog2
    :reader analog2
    :initarg :analog2
    :type cl:float
    :initform 0.0)
   (analog3
    :reader analog3
    :initarg :analog3
    :type cl:float
    :initform 0.0)
   (analog4
    :reader analog4
    :initarg :analog4
    :type cl:float
    :initform 0.0))
)

(cl:defclass AutopilotADCSamples (<AutopilotADCSamples>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotADCSamples>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotADCSamples)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotADCSamples> is deprecated: use seagull_autopilot_msgs-msg:AutopilotADCSamples instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotADCSamples>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'analog1-val :lambda-list '(m))
(cl:defmethod analog1-val ((m <AutopilotADCSamples>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:analog1-val is deprecated.  Use seagull_autopilot_msgs-msg:analog1 instead.")
  (analog1 m))

(cl:ensure-generic-function 'analog2-val :lambda-list '(m))
(cl:defmethod analog2-val ((m <AutopilotADCSamples>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:analog2-val is deprecated.  Use seagull_autopilot_msgs-msg:analog2 instead.")
  (analog2 m))

(cl:ensure-generic-function 'analog3-val :lambda-list '(m))
(cl:defmethod analog3-val ((m <AutopilotADCSamples>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:analog3-val is deprecated.  Use seagull_autopilot_msgs-msg:analog3 instead.")
  (analog3 m))

(cl:ensure-generic-function 'analog4-val :lambda-list '(m))
(cl:defmethod analog4-val ((m <AutopilotADCSamples>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:analog4-val is deprecated.  Use seagull_autopilot_msgs-msg:analog4 instead.")
  (analog4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotADCSamples>) ostream)
  "Serializes a message object of type '<AutopilotADCSamples>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'analog1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'analog2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'analog3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'analog4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotADCSamples>) istream)
  "Deserializes a message object of type '<AutopilotADCSamples>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'analog1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'analog2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'analog3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'analog4) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotADCSamples>)))
  "Returns string type for a message object of type '<AutopilotADCSamples>"
  "seagull_autopilot_msgs/AutopilotADCSamples")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotADCSamples)))
  "Returns string type for a message object of type 'AutopilotADCSamples"
  "seagull_autopilot_msgs/AutopilotADCSamples")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotADCSamples>)))
  "Returns md5sum for a message object of type '<AutopilotADCSamples>"
  "014d628585b086902e386fb5de78db2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotADCSamples)))
  "Returns md5sum for a message object of type 'AutopilotADCSamples"
  "014d628585b086902e386fb5de78db2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotADCSamples>)))
  "Returns full string definition for message of type '<AutopilotADCSamples>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%float32 analog1~%float32 analog2~%float32 analog3~%float32 analog4~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotADCSamples)))
  "Returns full string definition for message of type 'AutopilotADCSamples"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%float32 analog1~%float32 analog2~%float32 analog3~%float32 analog4~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotADCSamples>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotADCSamples>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotADCSamples
    (cl:cons ':header (header msg))
    (cl:cons ':analog1 (analog1 msg))
    (cl:cons ':analog2 (analog2 msg))
    (cl:cons ':analog3 (analog3 msg))
    (cl:cons ':analog4 (analog4 msg))
))
