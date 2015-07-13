; Auto-generated. Do not edit!


(cl:in-package seagull_commons_msgs-msg)


;//! \htmlinclude CommsParameters.msg.html

(cl:defclass <CommsParameters> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (retries
    :reader retries
    :initarg :retries
    :type cl:fixnum
    :initform 0)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:fixnum
    :initform 0)
   (dispatch_rate
    :reader dispatch_rate
    :initarg :dispatch_rate
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CommsParameters (<CommsParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CommsParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CommsParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_commons_msgs-msg:<CommsParameters> is deprecated: use seagull_commons_msgs-msg:CommsParameters instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CommsParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:header-val is deprecated.  Use seagull_commons_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'retries-val :lambda-list '(m))
(cl:defmethod retries-val ((m <CommsParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:retries-val is deprecated.  Use seagull_commons_msgs-msg:retries instead.")
  (retries m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <CommsParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:timeout-val is deprecated.  Use seagull_commons_msgs-msg:timeout instead.")
  (timeout m))

(cl:ensure-generic-function 'dispatch_rate-val :lambda-list '(m))
(cl:defmethod dispatch_rate-val ((m <CommsParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:dispatch_rate-val is deprecated.  Use seagull_commons_msgs-msg:dispatch_rate instead.")
  (dispatch_rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CommsParameters>) ostream)
  "Serializes a message object of type '<CommsParameters>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'retries)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'timeout)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dispatch_rate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CommsParameters>) istream)
  "Deserializes a message object of type '<CommsParameters>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'retries) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeout) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dispatch_rate) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CommsParameters>)))
  "Returns string type for a message object of type '<CommsParameters>"
  "seagull_commons_msgs/CommsParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CommsParameters)))
  "Returns string type for a message object of type 'CommsParameters"
  "seagull_commons_msgs/CommsParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CommsParameters>)))
  "Returns md5sum for a message object of type '<CommsParameters>"
  "389b742ee095b87f5422f6fc00ec3306")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CommsParameters)))
  "Returns md5sum for a message object of type 'CommsParameters"
  "389b742ee095b87f5422f6fc00ec3306")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CommsParameters>)))
  "Returns full string definition for message of type '<CommsParameters>"
  (cl:format cl:nil "SeagullHeader header~%int8 retries~%int16 timeout~%int16 dispatch_rate~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CommsParameters)))
  "Returns full string definition for message of type 'CommsParameters"
  (cl:format cl:nil "SeagullHeader header~%int8 retries~%int16 timeout~%int16 dispatch_rate~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CommsParameters>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CommsParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'CommsParameters
    (cl:cons ':header (header msg))
    (cl:cons ':retries (retries msg))
    (cl:cons ':timeout (timeout msg))
    (cl:cons ':dispatch_rate (dispatch_rate msg))
))
