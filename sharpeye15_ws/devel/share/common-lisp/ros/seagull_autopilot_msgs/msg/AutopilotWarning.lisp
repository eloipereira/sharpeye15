; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotWarning.msg.html

(cl:defclass <AutopilotWarning> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0)
   (code
    :reader code
    :initarg :code
    :type cl:fixnum
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass AutopilotWarning (<AutopilotWarning>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotWarning>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotWarning)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotWarning> is deprecated: use seagull_autopilot_msgs-msg:AutopilotWarning instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotWarning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <AutopilotWarning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:command-val is deprecated.  Use seagull_autopilot_msgs-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <AutopilotWarning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:code-val is deprecated.  Use seagull_autopilot_msgs-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <AutopilotWarning>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:message-val is deprecated.  Use seagull_autopilot_msgs-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotWarning>) ostream)
  "Serializes a message object of type '<AutopilotWarning>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotWarning>) istream)
  "Deserializes a message object of type '<AutopilotWarning>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotWarning>)))
  "Returns string type for a message object of type '<AutopilotWarning>"
  "seagull_autopilot_msgs/AutopilotWarning")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotWarning)))
  "Returns string type for a message object of type 'AutopilotWarning"
  "seagull_autopilot_msgs/AutopilotWarning")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotWarning>)))
  "Returns md5sum for a message object of type '<AutopilotWarning>"
  "2df7c3cdabb7bcdfc754ce5b420bfa80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotWarning)))
  "Returns md5sum for a message object of type 'AutopilotWarning"
  "2df7c3cdabb7bcdfc754ce5b420bfa80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotWarning>)))
  "Returns full string definition for message of type '<AutopilotWarning>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 command~%uint8 code~%string message~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotWarning)))
  "Returns full string definition for message of type 'AutopilotWarning"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 command~%uint8 code~%string message~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotWarning>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotWarning>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotWarning
    (cl:cons ':header (header msg))
    (cl:cons ':command (command msg))
    (cl:cons ':code (code msg))
    (cl:cons ':message (message msg))
))
