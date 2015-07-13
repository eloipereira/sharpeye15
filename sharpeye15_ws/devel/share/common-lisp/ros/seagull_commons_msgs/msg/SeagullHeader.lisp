; Auto-generated. Do not edit!


(cl:in-package seagull_commons_msgs-msg)


;//! \htmlinclude SeagullHeader.msg.html

(cl:defclass <SeagullHeader> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vehicleId
    :reader vehicleId
    :initarg :vehicleId
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SeagullHeader (<SeagullHeader>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SeagullHeader>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SeagullHeader)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_commons_msgs-msg:<SeagullHeader> is deprecated: use seagull_commons_msgs-msg:SeagullHeader instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SeagullHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:header-val is deprecated.  Use seagull_commons_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vehicleId-val :lambda-list '(m))
(cl:defmethod vehicleId-val ((m <SeagullHeader>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:vehicleId-val is deprecated.  Use seagull_commons_msgs-msg:vehicleId instead.")
  (vehicleId m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SeagullHeader>) ostream)
  "Serializes a message object of type '<SeagullHeader>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vehicleId)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vehicleId)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SeagullHeader>) istream)
  "Deserializes a message object of type '<SeagullHeader>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vehicleId)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vehicleId)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SeagullHeader>)))
  "Returns string type for a message object of type '<SeagullHeader>"
  "seagull_commons_msgs/SeagullHeader")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SeagullHeader)))
  "Returns string type for a message object of type 'SeagullHeader"
  "seagull_commons_msgs/SeagullHeader")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SeagullHeader>)))
  "Returns md5sum for a message object of type '<SeagullHeader>"
  "619cf0b2e31012acc6ab1b3cca1ecf78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SeagullHeader)))
  "Returns md5sum for a message object of type 'SeagullHeader"
  "619cf0b2e31012acc6ab1b3cca1ecf78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SeagullHeader>)))
  "Returns full string definition for message of type '<SeagullHeader>"
  (cl:format cl:nil "Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SeagullHeader)))
  "Returns full string definition for message of type 'SeagullHeader"
  (cl:format cl:nil "Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SeagullHeader>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SeagullHeader>))
  "Converts a ROS message object to a list"
  (cl:list 'SeagullHeader
    (cl:cons ':header (header msg))
    (cl:cons ':vehicleId (vehicleId msg))
))
