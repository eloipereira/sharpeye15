; Auto-generated. Do not edit!


(cl:in-package seagull_commons_msgs-msg)


;//! \htmlinclude SeagullHeartbeat.msg.html

(cl:defclass <SeagullHeartbeat> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (node
    :reader node
    :initarg :node
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SeagullHeartbeat (<SeagullHeartbeat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SeagullHeartbeat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SeagullHeartbeat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_commons_msgs-msg:<SeagullHeartbeat> is deprecated: use seagull_commons_msgs-msg:SeagullHeartbeat instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SeagullHeartbeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:header-val is deprecated.  Use seagull_commons_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <SeagullHeartbeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_commons_msgs-msg:node-val is deprecated.  Use seagull_commons_msgs-msg:node instead.")
  (node m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SeagullHeartbeat>)))
    "Constants for message type '<SeagullHeartbeat>"
  '((:HB_AIS_DRIVER . 0)
    (:HB_GOBI_FG . 1)
    (:HB_JAI_FG . 2)
    (:HB_TASE_FG . 3)
    (:HB_DETECTION_MODULE . 4)
    (:HB_SEAGULL_MANAGER . 5)
    (:HB_TASE_DRIVER . 6)
    (:HB_TASE_COMMS . 7)
    (:HB_COMMS_RELAY . 8)
    (:HB_AP_DRIVER . 9)
    (:HB_AP_COMMS . 10)
    (:HB_CONTROL_SUPERVISOR . 11)
    (:HB_TARGET_TRACKING . 12)
    (:HB_SENSE_AVOID . 13)
    (:HB_ADSB_DRIVER . 14))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SeagullHeartbeat)))
    "Constants for message type 'SeagullHeartbeat"
  '((:HB_AIS_DRIVER . 0)
    (:HB_GOBI_FG . 1)
    (:HB_JAI_FG . 2)
    (:HB_TASE_FG . 3)
    (:HB_DETECTION_MODULE . 4)
    (:HB_SEAGULL_MANAGER . 5)
    (:HB_TASE_DRIVER . 6)
    (:HB_TASE_COMMS . 7)
    (:HB_COMMS_RELAY . 8)
    (:HB_AP_DRIVER . 9)
    (:HB_AP_COMMS . 10)
    (:HB_CONTROL_SUPERVISOR . 11)
    (:HB_TARGET_TRACKING . 12)
    (:HB_SENSE_AVOID . 13)
    (:HB_ADSB_DRIVER . 14))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SeagullHeartbeat>) ostream)
  "Serializes a message object of type '<SeagullHeartbeat>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SeagullHeartbeat>) istream)
  "Deserializes a message object of type '<SeagullHeartbeat>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SeagullHeartbeat>)))
  "Returns string type for a message object of type '<SeagullHeartbeat>"
  "seagull_commons_msgs/SeagullHeartbeat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SeagullHeartbeat)))
  "Returns string type for a message object of type 'SeagullHeartbeat"
  "seagull_commons_msgs/SeagullHeartbeat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SeagullHeartbeat>)))
  "Returns md5sum for a message object of type '<SeagullHeartbeat>"
  "62b94c14302d5b1cb99c74aba1c738c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SeagullHeartbeat)))
  "Returns md5sum for a message object of type 'SeagullHeartbeat"
  "62b94c14302d5b1cb99c74aba1c738c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SeagullHeartbeat>)))
  "Returns full string definition for message of type '<SeagullHeartbeat>"
  (cl:format cl:nil "Header header~%uint8 node~%      uint8 HB_AIS_DRIVER=0~%      uint8 HB_GOBI_FG=1~%      uint8 HB_JAI_FG=2~%      uint8 HB_TASE_FG=3~%      uint8 HB_DETECTION_MODULE=4~%      uint8 HB_SEAGULL_MANAGER=5~%      uint8 HB_TASE_DRIVER=6~%      uint8 HB_TASE_COMMS=7      ~%      uint8 HB_COMMS_RELAY=8~%      uint8 HB_AP_DRIVER=9~%      uint8 HB_AP_COMMS=10~%      uint8 HB_CONTROL_SUPERVISOR=11~%      uint8 HB_TARGET_TRACKING=12~%      uint8 HB_SENSE_AVOID=13~%      uint8 HB_ADSB_DRIVER=14~%      ~%      ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SeagullHeartbeat)))
  "Returns full string definition for message of type 'SeagullHeartbeat"
  (cl:format cl:nil "Header header~%uint8 node~%      uint8 HB_AIS_DRIVER=0~%      uint8 HB_GOBI_FG=1~%      uint8 HB_JAI_FG=2~%      uint8 HB_TASE_FG=3~%      uint8 HB_DETECTION_MODULE=4~%      uint8 HB_SEAGULL_MANAGER=5~%      uint8 HB_TASE_DRIVER=6~%      uint8 HB_TASE_COMMS=7      ~%      uint8 HB_COMMS_RELAY=8~%      uint8 HB_AP_DRIVER=9~%      uint8 HB_AP_COMMS=10~%      uint8 HB_CONTROL_SUPERVISOR=11~%      uint8 HB_TARGET_TRACKING=12~%      uint8 HB_SENSE_AVOID=13~%      uint8 HB_ADSB_DRIVER=14~%      ~%      ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SeagullHeartbeat>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SeagullHeartbeat>))
  "Converts a ROS message object to a list"
  (cl:list 'SeagullHeartbeat
    (cl:cons ':header (header msg))
    (cl:cons ':node (node msg))
))
