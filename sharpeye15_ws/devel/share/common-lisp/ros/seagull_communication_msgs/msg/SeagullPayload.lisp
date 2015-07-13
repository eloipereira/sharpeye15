; Auto-generated. Do not edit!


(cl:in-package seagull_communication_msgs-msg)


;//! \htmlinclude SeagullPayload.msg.html

(cl:defclass <SeagullPayload> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (requiresAck
    :reader requiresAck
    :initarg :requiresAck
    :type cl:boolean
    :initform cl:nil)
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass SeagullPayload (<SeagullPayload>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SeagullPayload>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SeagullPayload)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_communication_msgs-msg:<SeagullPayload> is deprecated: use seagull_communication_msgs-msg:SeagullPayload instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SeagullPayload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_communication_msgs-msg:header-val is deprecated.  Use seagull_communication_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'requiresAck-val :lambda-list '(m))
(cl:defmethod requiresAck-val ((m <SeagullPayload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_communication_msgs-msg:requiresAck-val is deprecated.  Use seagull_communication_msgs-msg:requiresAck instead.")
  (requiresAck m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <SeagullPayload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_communication_msgs-msg:length-val is deprecated.  Use seagull_communication_msgs-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SeagullPayload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_communication_msgs-msg:data-val is deprecated.  Use seagull_communication_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SeagullPayload>) ostream)
  "Serializes a message object of type '<SeagullPayload>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'requiresAck) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SeagullPayload>) istream)
  "Deserializes a message object of type '<SeagullPayload>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'requiresAck) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SeagullPayload>)))
  "Returns string type for a message object of type '<SeagullPayload>"
  "seagull_communication_msgs/SeagullPayload")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SeagullPayload)))
  "Returns string type for a message object of type 'SeagullPayload"
  "seagull_communication_msgs/SeagullPayload")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SeagullPayload>)))
  "Returns md5sum for a message object of type '<SeagullPayload>"
  "7c3ace7751a703b22cc8a80bfc815e64")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SeagullPayload)))
  "Returns md5sum for a message object of type 'SeagullPayload"
  "7c3ace7751a703b22cc8a80bfc815e64")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SeagullPayload>)))
  "Returns full string definition for message of type '<SeagullPayload>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%bool requiresAck~%uint32 length~%uint8[] data  ~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SeagullPayload)))
  "Returns full string definition for message of type 'SeagullPayload"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%bool requiresAck~%uint32 length~%uint8[] data  ~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SeagullPayload>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SeagullPayload>))
  "Converts a ROS message object to a list"
  (cl:list 'SeagullPayload
    (cl:cons ':header (header msg))
    (cl:cons ':requiresAck (requiresAck msg))
    (cl:cons ':length (length msg))
    (cl:cons ':data (data msg))
))
