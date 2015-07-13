; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotUserAction.msg.html

(cl:defclass <AutopilotUserAction> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (action
    :reader action
    :initarg :action
    :type cl:fixnum
    :initform 0)
   (on
    :reader on
    :initarg :on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AutopilotUserAction (<AutopilotUserAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotUserAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotUserAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotUserAction> is deprecated: use seagull_autopilot_msgs-msg:AutopilotUserAction instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotUserAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <AutopilotUserAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:action-val is deprecated.  Use seagull_autopilot_msgs-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'on-val :lambda-list '(m))
(cl:defmethod on-val ((m <AutopilotUserAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:on-val is deprecated.  Use seagull_autopilot_msgs-msg:on instead.")
  (on m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AutopilotUserAction>)))
    "Constants for message type '<AutopilotUserAction>"
  '((:UA_ACTION0 . 0)
    (:UA_ACTION1 . 1)
    (:UA_ACTION2 . 2)
    (:UA_ACTION3 . 3)
    (:UA_ACTION4 . 4)
    (:UA_ACTION5 . 5)
    (:UA_ACTION6 . 6)
    (:UA_ACTION7 . 7))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AutopilotUserAction)))
    "Constants for message type 'AutopilotUserAction"
  '((:UA_ACTION0 . 0)
    (:UA_ACTION1 . 1)
    (:UA_ACTION2 . 2)
    (:UA_ACTION3 . 3)
    (:UA_ACTION4 . 4)
    (:UA_ACTION5 . 5)
    (:UA_ACTION6 . 6)
    (:UA_ACTION7 . 7))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotUserAction>) ostream)
  "Serializes a message object of type '<AutopilotUserAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotUserAction>) istream)
  "Deserializes a message object of type '<AutopilotUserAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotUserAction>)))
  "Returns string type for a message object of type '<AutopilotUserAction>"
  "seagull_autopilot_msgs/AutopilotUserAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotUserAction)))
  "Returns string type for a message object of type 'AutopilotUserAction"
  "seagull_autopilot_msgs/AutopilotUserAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotUserAction>)))
  "Returns md5sum for a message object of type '<AutopilotUserAction>"
  "3fa4894e20b298a9316812ce9cf223c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotUserAction)))
  "Returns md5sum for a message object of type 'AutopilotUserAction"
  "3fa4894e20b298a9316812ce9cf223c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotUserAction>)))
  "Returns full string definition for message of type '<AutopilotUserAction>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 	action~%bool 	on~%#ENUM Valid User actions~%	uint8 UA_ACTION0=0~%	uint8 UA_ACTION1=1~%	uint8 UA_ACTION2=2~%	uint8 UA_ACTION3=3~%	uint8 UA_ACTION4=4~%	uint8 UA_ACTION5=5~%	uint8 UA_ACTION6=6~%	uint8 UA_ACTION7=7~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotUserAction)))
  "Returns full string definition for message of type 'AutopilotUserAction"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 	action~%bool 	on~%#ENUM Valid User actions~%	uint8 UA_ACTION0=0~%	uint8 UA_ACTION1=1~%	uint8 UA_ACTION2=2~%	uint8 UA_ACTION3=3~%	uint8 UA_ACTION4=4~%	uint8 UA_ACTION5=5~%	uint8 UA_ACTION6=6~%	uint8 UA_ACTION7=7~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotUserAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotUserAction>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotUserAction
    (cl:cons ':header (header msg))
    (cl:cons ':action (action msg))
    (cl:cons ':on (on msg))
))
