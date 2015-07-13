; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotMissionSettings.msg.html

(cl:defclass <AutopilotMissionSettings> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (altitude_min
    :reader altitude_min
    :initarg :altitude_min
    :type cl:fixnum
    :initform 0)
   (altitude_max
    :reader altitude_max
    :initarg :altitude_max
    :type cl:fixnum
    :initform 0)
   (fligth_timeout
    :reader fligth_timeout
    :initarg :fligth_timeout
    :type cl:integer
    :initform 0))
)

(cl:defclass AutopilotMissionSettings (<AutopilotMissionSettings>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotMissionSettings>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotMissionSettings)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotMissionSettings> is deprecated: use seagull_autopilot_msgs-msg:AutopilotMissionSettings instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotMissionSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'altitude_min-val :lambda-list '(m))
(cl:defmethod altitude_min-val ((m <AutopilotMissionSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:altitude_min-val is deprecated.  Use seagull_autopilot_msgs-msg:altitude_min instead.")
  (altitude_min m))

(cl:ensure-generic-function 'altitude_max-val :lambda-list '(m))
(cl:defmethod altitude_max-val ((m <AutopilotMissionSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:altitude_max-val is deprecated.  Use seagull_autopilot_msgs-msg:altitude_max instead.")
  (altitude_max m))

(cl:ensure-generic-function 'fligth_timeout-val :lambda-list '(m))
(cl:defmethod fligth_timeout-val ((m <AutopilotMissionSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:fligth_timeout-val is deprecated.  Use seagull_autopilot_msgs-msg:fligth_timeout instead.")
  (fligth_timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotMissionSettings>) ostream)
  "Serializes a message object of type '<AutopilotMissionSettings>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'altitude_min)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'altitude_max)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fligth_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fligth_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fligth_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fligth_timeout)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotMissionSettings>) istream)
  "Deserializes a message object of type '<AutopilotMissionSettings>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'altitude_min) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'altitude_max) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fligth_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'fligth_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'fligth_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'fligth_timeout)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotMissionSettings>)))
  "Returns string type for a message object of type '<AutopilotMissionSettings>"
  "seagull_autopilot_msgs/AutopilotMissionSettings")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotMissionSettings)))
  "Returns string type for a message object of type 'AutopilotMissionSettings"
  "seagull_autopilot_msgs/AutopilotMissionSettings")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotMissionSettings>)))
  "Returns md5sum for a message object of type '<AutopilotMissionSettings>"
  "8b0ed07c0984f0d2fcee17bed5e0c1fd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotMissionSettings)))
  "Returns md5sum for a message object of type 'AutopilotMissionSettings"
  "8b0ed07c0984f0d2fcee17bed5e0c1fd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotMissionSettings>)))
  "Returns full string definition for message of type '<AutopilotMissionSettings>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int16 altitude_min~%int16 altitude_max~%uint32 fligth_timeout~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotMissionSettings)))
  "Returns full string definition for message of type 'AutopilotMissionSettings"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%int16 altitude_min~%int16 altitude_max~%uint32 fligth_timeout~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotMissionSettings>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotMissionSettings>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotMissionSettings
    (cl:cons ':header (header msg))
    (cl:cons ':altitude_min (altitude_min msg))
    (cl:cons ':altitude_max (altitude_max msg))
    (cl:cons ':fligth_timeout (fligth_timeout msg))
))
