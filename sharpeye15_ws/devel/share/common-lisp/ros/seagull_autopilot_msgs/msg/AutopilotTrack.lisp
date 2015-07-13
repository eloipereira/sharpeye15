; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotTrack.msg.html

(cl:defclass <AutopilotTrack> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (to
    :reader to
    :initarg :to
    :type cl:fixnum
    :initform 0)
   (go_to
    :reader go_to
    :initarg :go_to
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AutopilotTrack (<AutopilotTrack>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotTrack>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotTrack)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotTrack> is deprecated: use seagull_autopilot_msgs-msg:AutopilotTrack instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'to-val :lambda-list '(m))
(cl:defmethod to-val ((m <AutopilotTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:to-val is deprecated.  Use seagull_autopilot_msgs-msg:to instead.")
  (to m))

(cl:ensure-generic-function 'go_to-val :lambda-list '(m))
(cl:defmethod go_to-val ((m <AutopilotTrack>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:go_to-val is deprecated.  Use seagull_autopilot_msgs-msg:go_to instead.")
  (go_to m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotTrack>) ostream)
  "Serializes a message object of type '<AutopilotTrack>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'to)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'go_to)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotTrack>) istream)
  "Deserializes a message object of type '<AutopilotTrack>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'to) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'go_to) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotTrack>)))
  "Returns string type for a message object of type '<AutopilotTrack>"
  "seagull_autopilot_msgs/AutopilotTrack")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotTrack)))
  "Returns string type for a message object of type 'AutopilotTrack"
  "seagull_autopilot_msgs/AutopilotTrack")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotTrack>)))
  "Returns md5sum for a message object of type '<AutopilotTrack>"
  "92b29beb22b2471f3f315f2cfd63a06c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotTrack)))
  "Returns md5sum for a message object of type 'AutopilotTrack"
  "92b29beb22b2471f3f315f2cfd63a06c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotTrack>)))
  "Returns full string definition for message of type '<AutopilotTrack>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 to~%int8 go_to~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotTrack)))
  "Returns full string definition for message of type 'AutopilotTrack"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int8 to~%int8 go_to~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotTrack>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotTrack>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotTrack
    (cl:cons ':header (header msg))
    (cl:cons ':to (to msg))
    (cl:cons ':go_to (go_to msg))
))
