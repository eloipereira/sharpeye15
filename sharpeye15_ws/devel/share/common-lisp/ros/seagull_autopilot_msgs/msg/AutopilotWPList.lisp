; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotWPList.msg.html

(cl:defclass <AutopilotWPList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (list
    :reader list
    :initarg :list
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AutopilotWPList (<AutopilotWPList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotWPList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotWPList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotWPList> is deprecated: use seagull_autopilot_msgs-msg:AutopilotWPList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotWPList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <AutopilotWPList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:list-val is deprecated.  Use seagull_autopilot_msgs-msg:list instead.")
  (list m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <AutopilotWPList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:type-val is deprecated.  Use seagull_autopilot_msgs-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AutopilotWPList>)))
    "Constants for message type '<AutopilotWPList>"
  '((:LT_REQUEST_RESPONSE . 0)
    (:LT_DELETE . 1)
    (:LT_REQUEST . 2)
    (:LT_ADD . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AutopilotWPList)))
    "Constants for message type 'AutopilotWPList"
  '((:LT_REQUEST_RESPONSE . 0)
    (:LT_DELETE . 1)
    (:LT_REQUEST . 2)
    (:LT_ADD . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotWPList>) ostream)
  "Serializes a message object of type '<AutopilotWPList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'list))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotWPList>) istream)
  "Deserializes a message object of type '<AutopilotWPList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotWPList>)))
  "Returns string type for a message object of type '<AutopilotWPList>"
  "seagull_autopilot_msgs/AutopilotWPList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotWPList)))
  "Returns string type for a message object of type 'AutopilotWPList"
  "seagull_autopilot_msgs/AutopilotWPList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotWPList>)))
  "Returns md5sum for a message object of type '<AutopilotWPList>"
  "fc2d6f4cb708b1a62a4a5c56c164c7ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotWPList)))
  "Returns md5sum for a message object of type 'AutopilotWPList"
  "fc2d6f4cb708b1a62a4a5c56c164c7ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotWPList>)))
  "Returns full string definition for message of type '<AutopilotWPList>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8[] list~%uint8 type~%	uint8 LT_REQUEST_RESPONSE=0~% 	uint8 LT_DELETE=1~% 	uint8 LT_REQUEST=2~%    uint8 LT_ADD=3~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotWPList)))
  "Returns full string definition for message of type 'AutopilotWPList"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8[] list~%uint8 type~%	uint8 LT_REQUEST_RESPONSE=0~% 	uint8 LT_DELETE=1~% 	uint8 LT_REQUEST=2~%    uint8 LT_ADD=3~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotWPList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotWPList>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotWPList
    (cl:cons ':header (header msg))
    (cl:cons ':list (list msg))
    (cl:cons ':type (type msg))
))
