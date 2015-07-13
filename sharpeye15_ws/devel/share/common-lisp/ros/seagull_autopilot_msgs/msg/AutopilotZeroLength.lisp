; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotZeroLength.msg.html

(cl:defclass <AutopilotZeroLength> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (messageType
    :reader messageType
    :initarg :messageType
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AutopilotZeroLength (<AutopilotZeroLength>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotZeroLength>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotZeroLength)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotZeroLength> is deprecated: use seagull_autopilot_msgs-msg:AutopilotZeroLength instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotZeroLength>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'messageType-val :lambda-list '(m))
(cl:defmethod messageType-val ((m <AutopilotZeroLength>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:messageType-val is deprecated.  Use seagull_autopilot_msgs-msg:messageType instead.")
  (messageType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotZeroLength>) ostream)
  "Serializes a message object of type '<AutopilotZeroLength>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'messageType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotZeroLength>) istream)
  "Deserializes a message object of type '<AutopilotZeroLength>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'messageType) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotZeroLength>)))
  "Returns string type for a message object of type '<AutopilotZeroLength>"
  "seagull_autopilot_msgs/AutopilotZeroLength")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotZeroLength)))
  "Returns string type for a message object of type 'AutopilotZeroLength"
  "seagull_autopilot_msgs/AutopilotZeroLength")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotZeroLength>)))
  "Returns md5sum for a message object of type '<AutopilotZeroLength>"
  "09b8db8e6651718203e06a19f8bc5110")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotZeroLength)))
  "Returns md5sum for a message object of type 'AutopilotZeroLength"
  "09b8db8e6651718203e06a19f8bc5110")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotZeroLength>)))
  "Returns full string definition for message of type '<AutopilotZeroLength>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 messageType~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotZeroLength)))
  "Returns full string definition for message of type 'AutopilotZeroLength"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 messageType~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotZeroLength>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotZeroLength>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotZeroLength
    (cl:cons ':header (header msg))
    (cl:cons ':messageType (messageType msg))
))
