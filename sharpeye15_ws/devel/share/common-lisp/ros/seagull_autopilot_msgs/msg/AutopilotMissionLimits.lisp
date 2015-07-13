; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotMissionLimits.msg.html

(cl:defclass <AutopilotMissionLimits> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (request
    :reader request
    :initarg :request
    :type cl:boolean
    :initform cl:nil)
   (comms_timeout
    :reader comms_timeout
    :initarg :comms_timeout
    :type cl:integer
    :initform 0)
   (pilot_timeout
    :reader pilot_timeout
    :initarg :pilot_timeout
    :type cl:integer
    :initform 0)
   (gps_timeout
    :reader gps_timeout
    :initarg :gps_timeout
    :type cl:integer
    :initform 0)
   (lost_comms_wp
    :reader lost_comms_wp
    :initarg :lost_comms_wp
    :type cl:fixnum
    :initform 0)
   (autoland_wp
    :reader autoland_wp
    :initarg :autoland_wp
    :type cl:fixnum
    :initform 0)
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
    :initform 0)
   (failure0
    :reader failure0
    :initarg :failure0
    :type cl:fixnum
    :initform 0)
   (failure1
    :reader failure1
    :initarg :failure1
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AutopilotMissionLimits (<AutopilotMissionLimits>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotMissionLimits>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotMissionLimits)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotMissionLimits> is deprecated: use seagull_autopilot_msgs-msg:AutopilotMissionLimits instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:request-val is deprecated.  Use seagull_autopilot_msgs-msg:request instead.")
  (request m))

(cl:ensure-generic-function 'comms_timeout-val :lambda-list '(m))
(cl:defmethod comms_timeout-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:comms_timeout-val is deprecated.  Use seagull_autopilot_msgs-msg:comms_timeout instead.")
  (comms_timeout m))

(cl:ensure-generic-function 'pilot_timeout-val :lambda-list '(m))
(cl:defmethod pilot_timeout-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:pilot_timeout-val is deprecated.  Use seagull_autopilot_msgs-msg:pilot_timeout instead.")
  (pilot_timeout m))

(cl:ensure-generic-function 'gps_timeout-val :lambda-list '(m))
(cl:defmethod gps_timeout-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:gps_timeout-val is deprecated.  Use seagull_autopilot_msgs-msg:gps_timeout instead.")
  (gps_timeout m))

(cl:ensure-generic-function 'lost_comms_wp-val :lambda-list '(m))
(cl:defmethod lost_comms_wp-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:lost_comms_wp-val is deprecated.  Use seagull_autopilot_msgs-msg:lost_comms_wp instead.")
  (lost_comms_wp m))

(cl:ensure-generic-function 'autoland_wp-val :lambda-list '(m))
(cl:defmethod autoland_wp-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:autoland_wp-val is deprecated.  Use seagull_autopilot_msgs-msg:autoland_wp instead.")
  (autoland_wp m))

(cl:ensure-generic-function 'altitude_min-val :lambda-list '(m))
(cl:defmethod altitude_min-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:altitude_min-val is deprecated.  Use seagull_autopilot_msgs-msg:altitude_min instead.")
  (altitude_min m))

(cl:ensure-generic-function 'altitude_max-val :lambda-list '(m))
(cl:defmethod altitude_max-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:altitude_max-val is deprecated.  Use seagull_autopilot_msgs-msg:altitude_max instead.")
  (altitude_max m))

(cl:ensure-generic-function 'fligth_timeout-val :lambda-list '(m))
(cl:defmethod fligth_timeout-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:fligth_timeout-val is deprecated.  Use seagull_autopilot_msgs-msg:fligth_timeout instead.")
  (fligth_timeout m))

(cl:ensure-generic-function 'failure0-val :lambda-list '(m))
(cl:defmethod failure0-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:failure0-val is deprecated.  Use seagull_autopilot_msgs-msg:failure0 instead.")
  (failure0 m))

(cl:ensure-generic-function 'failure1-val :lambda-list '(m))
(cl:defmethod failure1-val ((m <AutopilotMissionLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:failure1-val is deprecated.  Use seagull_autopilot_msgs-msg:failure1 instead.")
  (failure1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotMissionLimits>) ostream)
  "Serializes a message object of type '<AutopilotMissionLimits>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'request) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'comms_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'comms_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'comms_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'comms_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pilot_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pilot_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pilot_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pilot_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gps_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'gps_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'gps_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lost_comms_wp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'autoland_wp)) ostream)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'failure0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'failure1)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotMissionLimits>) istream)
  "Deserializes a message object of type '<AutopilotMissionLimits>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'request) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'comms_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'comms_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'comms_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'comms_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pilot_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pilot_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pilot_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pilot_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'gps_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'gps_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'gps_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lost_comms_wp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'autoland_wp)) (cl:read-byte istream))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'failure0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'failure1)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotMissionLimits>)))
  "Returns string type for a message object of type '<AutopilotMissionLimits>"
  "seagull_autopilot_msgs/AutopilotMissionLimits")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotMissionLimits)))
  "Returns string type for a message object of type 'AutopilotMissionLimits"
  "seagull_autopilot_msgs/AutopilotMissionLimits")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotMissionLimits>)))
  "Returns md5sum for a message object of type '<AutopilotMissionLimits>"
  "042de3fc3f4f9595eb380111ebfe2421")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotMissionLimits)))
  "Returns md5sum for a message object of type 'AutopilotMissionLimits"
  "042de3fc3f4f9595eb380111ebfe2421")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotMissionLimits>)))
  "Returns full string definition for message of type '<AutopilotMissionLimits>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%bool request~%uint32 comms_timeout~%uint32 pilot_timeout~%uint32 gps_timeout~%uint8 lost_comms_wp~%uint8 autoland_wp~%int16 altitude_min~%int16 altitude_max~%uint32 fligth_timeout~%uint8 failure0~%uint8 failure1~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotMissionLimits)))
  "Returns full string definition for message of type 'AutopilotMissionLimits"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%bool request~%uint32 comms_timeout~%uint32 pilot_timeout~%uint32 gps_timeout~%uint8 lost_comms_wp~%uint8 autoland_wp~%int16 altitude_min~%int16 altitude_max~%uint32 fligth_timeout~%uint8 failure0~%uint8 failure1~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotMissionLimits>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     1
     1
     2
     2
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotMissionLimits>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotMissionLimits
    (cl:cons ':header (header msg))
    (cl:cons ':request (request msg))
    (cl:cons ':comms_timeout (comms_timeout msg))
    (cl:cons ':pilot_timeout (pilot_timeout msg))
    (cl:cons ':gps_timeout (gps_timeout msg))
    (cl:cons ':lost_comms_wp (lost_comms_wp msg))
    (cl:cons ':autoland_wp (autoland_wp msg))
    (cl:cons ':altitude_min (altitude_min msg))
    (cl:cons ':altitude_max (altitude_max msg))
    (cl:cons ':fligth_timeout (fligth_timeout msg))
    (cl:cons ':failure0 (failure0 msg))
    (cl:cons ':failure1 (failure1 msg))
))
