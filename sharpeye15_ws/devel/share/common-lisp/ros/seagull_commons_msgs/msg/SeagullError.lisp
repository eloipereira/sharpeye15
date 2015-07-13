; Auto-generated. Do not edit!


(cl:in-package seagull_commons_msgs-msg)


;//! \htmlinclude SeagullError.msg.html

(cl:defclass <SeagullError> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (errorType
    :reader errorType
    :initarg :errorType
    :type cl:fixnum
    :initform 0)
   (errorNode
    :reader errorNode
    :initarg :errorNode
    :type cl:fixnum
    :initform 0)
   (errorMsg
    :reader errorMsg
    :initarg :errorMsg
    :type cl:string
    :initform ""))
)

(cl:defclass SeagullError (<SeagullError>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SeagullError>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SeagullError)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_commons_msgs-msg:<SeagullError> is deprecated: use seagull_commons_msgs-msg:SeagullError instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SeagullError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:header-val is deprecated.  Use seagull_commons_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'errorType-val :lambda-list '(m))
(cl:defmethod errorType-val ((m <SeagullError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:errorType-val is deprecated.  Use seagull_commons_msgs-msg:errorType instead.")
  (errorType m))

(cl:ensure-generic-function 'errorNode-val :lambda-list '(m))
(cl:defmethod errorNode-val ((m <SeagullError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:errorNode-val is deprecated.  Use seagull_commons_msgs-msg:errorNode instead.")
  (errorNode m))

(cl:ensure-generic-function 'errorMsg-val :lambda-list '(m))
(cl:defmethod errorMsg-val ((m <SeagullError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:errorMsg-val is deprecated.  Use seagull_commons_msgs-msg:errorMsg instead.")
  (errorMsg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SeagullError>) ostream)
  "Serializes a message object of type '<SeagullError>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorType)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorNode)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'errorMsg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'errorMsg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SeagullError>) istream)
  "Deserializes a message object of type '<SeagullError>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorType)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errorNode)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'errorMsg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'errorMsg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SeagullError>)))
  "Returns string type for a message object of type '<SeagullError>"
  "seagull_commons_msgs/SeagullError")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SeagullError)))
  "Returns string type for a message object of type 'SeagullError"
  "seagull_commons_msgs/SeagullError")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SeagullError>)))
  "Returns md5sum for a message object of type '<SeagullError>"
  "179220cff18c069f6ad64fcdd63e1eea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SeagullError)))
  "Returns md5sum for a message object of type 'SeagullError"
  "179220cff18c069f6ad64fcdd63e1eea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SeagullError>)))
  "Returns full string definition for message of type '<SeagullError>"
  (cl:format cl:nil "Header header~%uint8 errorType~%uint8 errorNode~%string errorMsg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SeagullError)))
  "Returns full string definition for message of type 'SeagullError"
  (cl:format cl:nil "Header header~%uint8 errorType~%uint8 errorNode~%string errorMsg~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SeagullError>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4 (cl:length (cl:slot-value msg 'errorMsg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SeagullError>))
  "Converts a ROS message object to a list"
  (cl:list 'SeagullError
    (cl:cons ':header (header msg))
    (cl:cons ':errorType (errorType msg))
    (cl:cons ':errorNode (errorNode msg))
    (cl:cons ':errorMsg (errorMsg msg))
))
