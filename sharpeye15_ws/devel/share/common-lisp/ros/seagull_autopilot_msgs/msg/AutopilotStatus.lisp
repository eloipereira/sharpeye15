; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotStatus.msg.html

(cl:defclass <AutopilotStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (orbitRadius
    :reader orbitRadius
    :initarg :orbitRadius
    :type cl:fixnum
    :initform 0)
   (trackerStatus
    :reader trackerStatus
    :initarg :trackerStatus
    :type cl:fixnum
    :initform 0)
   (timeToWp
    :reader timeToWp
    :initarg :timeToWp
    :type cl:fixnum
    :initform 0)
   (wpFrom
    :reader wpFrom
    :initarg :wpFrom
    :type cl:fixnum
    :initform 0)
   (wpTo
    :reader wpTo
    :initarg :wpTo
    :type cl:fixnum
    :initform 0)
   (airBoundaryViolated
    :reader airBoundaryViolated
    :initarg :airBoundaryViolated
    :type cl:boolean
    :initform cl:nil)
   (autopilotEngineKill
    :reader autopilotEngineKill
    :initarg :autopilotEngineKill
    :type cl:boolean
    :initform cl:nil)
   (commsTimeout
    :reader commsTimeout
    :initarg :commsTimeout
    :type cl:boolean
    :initform cl:nil)
   (fligthTimerElapsed
    :reader fligthTimerElapsed
    :initarg :fligthTimerElapsed
    :type cl:boolean
    :initform cl:nil)
   (fligthTermination
    :reader fligthTermination
    :initarg :fligthTermination
    :type cl:boolean
    :initform cl:nil)
   (gpsTimeout
    :reader gpsTimeout
    :initarg :gpsTimeout
    :type cl:boolean
    :initform cl:nil)
   (orbiting
    :reader orbiting
    :initarg :orbiting
    :type cl:boolean
    :initform cl:nil)
   (loopControl1
    :reader loopControl1
    :initarg :loopControl1
    :type cl:fixnum
    :initform 0)
   (loopControl2
    :reader loopControl2
    :initarg :loopControl2
    :type cl:fixnum
    :initform 0)
   (loopControl3
    :reader loopControl3
    :initarg :loopControl3
    :type cl:fixnum
    :initform 0)
   (loopControl4
    :reader loopControl4
    :initarg :loopControl4
    :type cl:fixnum
    :initform 0)
   (loopControl5
    :reader loopControl5
    :initarg :loopControl5
    :type cl:fixnum
    :initform 0)
   (loopControl6
    :reader loopControl6
    :initarg :loopControl6
    :type cl:fixnum
    :initform 0)
   (loopControl7
    :reader loopControl7
    :initarg :loopControl7
    :type cl:fixnum
    :initform 0)
   (loopControl8
    :reader loopControl8
    :initarg :loopControl8
    :type cl:fixnum
    :initform 0)
   (loopControlCount
    :reader loopControlCount
    :initarg :loopControlCount
    :type cl:fixnum
    :initform 0)
   (userAction0
    :reader userAction0
    :initarg :userAction0
    :type cl:boolean
    :initform cl:nil)
   (userAction1
    :reader userAction1
    :initarg :userAction1
    :type cl:boolean
    :initform cl:nil)
   (userAction2
    :reader userAction2
    :initarg :userAction2
    :type cl:boolean
    :initform cl:nil)
   (userAction3
    :reader userAction3
    :initarg :userAction3
    :type cl:boolean
    :initform cl:nil)
   (userAction4
    :reader userAction4
    :initarg :userAction4
    :type cl:boolean
    :initform cl:nil)
   (userAction5
    :reader userAction5
    :initarg :userAction5
    :type cl:boolean
    :initform cl:nil)
   (userAction6
    :reader userAction6
    :initarg :userAction6
    :type cl:boolean
    :initform cl:nil)
   (userAction7
    :reader userAction7
    :initarg :userAction7
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AutopilotStatus (<AutopilotStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotStatus> is deprecated: use seagull_autopilot_msgs-msg:AutopilotStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'orbitRadius-val :lambda-list '(m))
(cl:defmethod orbitRadius-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:orbitRadius-val is deprecated.  Use seagull_autopilot_msgs-msg:orbitRadius instead.")
  (orbitRadius m))

(cl:ensure-generic-function 'trackerStatus-val :lambda-list '(m))
(cl:defmethod trackerStatus-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:trackerStatus-val is deprecated.  Use seagull_autopilot_msgs-msg:trackerStatus instead.")
  (trackerStatus m))

(cl:ensure-generic-function 'timeToWp-val :lambda-list '(m))
(cl:defmethod timeToWp-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:timeToWp-val is deprecated.  Use seagull_autopilot_msgs-msg:timeToWp instead.")
  (timeToWp m))

(cl:ensure-generic-function 'wpFrom-val :lambda-list '(m))
(cl:defmethod wpFrom-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:wpFrom-val is deprecated.  Use seagull_autopilot_msgs-msg:wpFrom instead.")
  (wpFrom m))

(cl:ensure-generic-function 'wpTo-val :lambda-list '(m))
(cl:defmethod wpTo-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:wpTo-val is deprecated.  Use seagull_autopilot_msgs-msg:wpTo instead.")
  (wpTo m))

(cl:ensure-generic-function 'airBoundaryViolated-val :lambda-list '(m))
(cl:defmethod airBoundaryViolated-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:airBoundaryViolated-val is deprecated.  Use seagull_autopilot_msgs-msg:airBoundaryViolated instead.")
  (airBoundaryViolated m))

(cl:ensure-generic-function 'autopilotEngineKill-val :lambda-list '(m))
(cl:defmethod autopilotEngineKill-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:autopilotEngineKill-val is deprecated.  Use seagull_autopilot_msgs-msg:autopilotEngineKill instead.")
  (autopilotEngineKill m))

(cl:ensure-generic-function 'commsTimeout-val :lambda-list '(m))
(cl:defmethod commsTimeout-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:commsTimeout-val is deprecated.  Use seagull_autopilot_msgs-msg:commsTimeout instead.")
  (commsTimeout m))

(cl:ensure-generic-function 'fligthTimerElapsed-val :lambda-list '(m))
(cl:defmethod fligthTimerElapsed-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:fligthTimerElapsed-val is deprecated.  Use seagull_autopilot_msgs-msg:fligthTimerElapsed instead.")
  (fligthTimerElapsed m))

(cl:ensure-generic-function 'fligthTermination-val :lambda-list '(m))
(cl:defmethod fligthTermination-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:fligthTermination-val is deprecated.  Use seagull_autopilot_msgs-msg:fligthTermination instead.")
  (fligthTermination m))

(cl:ensure-generic-function 'gpsTimeout-val :lambda-list '(m))
(cl:defmethod gpsTimeout-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:gpsTimeout-val is deprecated.  Use seagull_autopilot_msgs-msg:gpsTimeout instead.")
  (gpsTimeout m))

(cl:ensure-generic-function 'orbiting-val :lambda-list '(m))
(cl:defmethod orbiting-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:orbiting-val is deprecated.  Use seagull_autopilot_msgs-msg:orbiting instead.")
  (orbiting m))

(cl:ensure-generic-function 'loopControl1-val :lambda-list '(m))
(cl:defmethod loopControl1-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl1-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl1 instead.")
  (loopControl1 m))

(cl:ensure-generic-function 'loopControl2-val :lambda-list '(m))
(cl:defmethod loopControl2-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl2-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl2 instead.")
  (loopControl2 m))

(cl:ensure-generic-function 'loopControl3-val :lambda-list '(m))
(cl:defmethod loopControl3-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl3-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl3 instead.")
  (loopControl3 m))

(cl:ensure-generic-function 'loopControl4-val :lambda-list '(m))
(cl:defmethod loopControl4-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl4-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl4 instead.")
  (loopControl4 m))

(cl:ensure-generic-function 'loopControl5-val :lambda-list '(m))
(cl:defmethod loopControl5-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl5-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl5 instead.")
  (loopControl5 m))

(cl:ensure-generic-function 'loopControl6-val :lambda-list '(m))
(cl:defmethod loopControl6-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl6-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl6 instead.")
  (loopControl6 m))

(cl:ensure-generic-function 'loopControl7-val :lambda-list '(m))
(cl:defmethod loopControl7-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl7-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl7 instead.")
  (loopControl7 m))

(cl:ensure-generic-function 'loopControl8-val :lambda-list '(m))
(cl:defmethod loopControl8-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControl8-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControl8 instead.")
  (loopControl8 m))

(cl:ensure-generic-function 'loopControlCount-val :lambda-list '(m))
(cl:defmethod loopControlCount-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:loopControlCount-val is deprecated.  Use seagull_autopilot_msgs-msg:loopControlCount instead.")
  (loopControlCount m))

(cl:ensure-generic-function 'userAction0-val :lambda-list '(m))
(cl:defmethod userAction0-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction0-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction0 instead.")
  (userAction0 m))

(cl:ensure-generic-function 'userAction1-val :lambda-list '(m))
(cl:defmethod userAction1-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction1-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction1 instead.")
  (userAction1 m))

(cl:ensure-generic-function 'userAction2-val :lambda-list '(m))
(cl:defmethod userAction2-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction2-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction2 instead.")
  (userAction2 m))

(cl:ensure-generic-function 'userAction3-val :lambda-list '(m))
(cl:defmethod userAction3-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction3-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction3 instead.")
  (userAction3 m))

(cl:ensure-generic-function 'userAction4-val :lambda-list '(m))
(cl:defmethod userAction4-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction4-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction4 instead.")
  (userAction4 m))

(cl:ensure-generic-function 'userAction5-val :lambda-list '(m))
(cl:defmethod userAction5-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction5-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction5 instead.")
  (userAction5 m))

(cl:ensure-generic-function 'userAction6-val :lambda-list '(m))
(cl:defmethod userAction6-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction6-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction6 instead.")
  (userAction6 m))

(cl:ensure-generic-function 'userAction7-val :lambda-list '(m))
(cl:defmethod userAction7-val ((m <AutopilotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:userAction7-val is deprecated.  Use seagull_autopilot_msgs-msg:userAction7 instead.")
  (userAction7 m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AutopilotStatus>)))
    "Constants for message type '<AutopilotStatus>"
  '((:STATUS_OFF . 0)
    (:STATUS_ON . 1)
    (:STATUS_AUTO . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AutopilotStatus)))
    "Constants for message type 'AutopilotStatus"
  '((:STATUS_OFF . 0)
    (:STATUS_ON . 1)
    (:STATUS_AUTO . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotStatus>) ostream)
  "Serializes a message object of type '<AutopilotStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orbitRadius)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trackerStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeToWp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeToWp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wpFrom)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wpTo)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'airBoundaryViolated) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'autopilotEngineKill) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'commsTimeout) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fligthTimerElapsed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fligthTermination) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gpsTimeout) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'orbiting) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl5)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl6)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl7)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl8)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControlCount)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction0) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction1) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction5) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction6) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'userAction7) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotStatus>) istream)
  "Deserializes a message object of type '<AutopilotStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'orbitRadius)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trackerStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeToWp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeToWp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wpFrom)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wpTo)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'airBoundaryViolated) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'autopilotEngineKill) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'commsTimeout) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fligthTimerElapsed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fligthTermination) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gpsTimeout) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'orbiting) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl5)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl6)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl7)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControl8)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loopControlCount)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'userAction0) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction1) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction5) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction6) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'userAction7) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotStatus>)))
  "Returns string type for a message object of type '<AutopilotStatus>"
  "seagull_autopilot_msgs/AutopilotStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotStatus)))
  "Returns string type for a message object of type 'AutopilotStatus"
  "seagull_autopilot_msgs/AutopilotStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotStatus>)))
  "Returns md5sum for a message object of type '<AutopilotStatus>"
  "7020af956e00569af73fa27209515635")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotStatus)))
  "Returns md5sum for a message object of type 'AutopilotStatus"
  "7020af956e00569af73fa27209515635")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotStatus>)))
  "Returns full string definition for message of type '<AutopilotStatus>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 orbitRadius~%uint8 trackerStatus~%uint16 timeToWp~%uint8 wpFrom~%uint8 wpTo~%bool airBoundaryViolated~%bool autopilotEngineKill~%bool commsTimeout~%bool fligthTimerElapsed~%bool fligthTermination~%bool gpsTimeout~%bool orbiting~%uint8 loopControl1~%uint8 loopControl2~%uint8 loopControl3~%uint8 loopControl4~%uint8 loopControl5~%uint8 loopControl6~%uint8 loopControl7~%uint8 loopControl8~%uint8 loopControlCount~%	uint8 STATUS_OFF=0~%	uint8 STATUS_ON=1~%	uint8 STATUS_AUTO=2~%bool userAction0~%bool userAction1~%bool userAction2~%bool userAction3~%bool userAction4~%bool userAction5~%bool userAction6~%bool userAction7~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotStatus)))
  "Returns full string definition for message of type 'AutopilotStatus"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%uint8 orbitRadius~%uint8 trackerStatus~%uint16 timeToWp~%uint8 wpFrom~%uint8 wpTo~%bool airBoundaryViolated~%bool autopilotEngineKill~%bool commsTimeout~%bool fligthTimerElapsed~%bool fligthTermination~%bool gpsTimeout~%bool orbiting~%uint8 loopControl1~%uint8 loopControl2~%uint8 loopControl3~%uint8 loopControl4~%uint8 loopControl5~%uint8 loopControl6~%uint8 loopControl7~%uint8 loopControl8~%uint8 loopControlCount~%	uint8 STATUS_OFF=0~%	uint8 STATUS_ON=1~%	uint8 STATUS_AUTO=2~%bool userAction0~%bool userAction1~%bool userAction2~%bool userAction3~%bool userAction4~%bool userAction5~%bool userAction6~%bool userAction7~%~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     2
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotStatus
    (cl:cons ':header (header msg))
    (cl:cons ':orbitRadius (orbitRadius msg))
    (cl:cons ':trackerStatus (trackerStatus msg))
    (cl:cons ':timeToWp (timeToWp msg))
    (cl:cons ':wpFrom (wpFrom msg))
    (cl:cons ':wpTo (wpTo msg))
    (cl:cons ':airBoundaryViolated (airBoundaryViolated msg))
    (cl:cons ':autopilotEngineKill (autopilotEngineKill msg))
    (cl:cons ':commsTimeout (commsTimeout msg))
    (cl:cons ':fligthTimerElapsed (fligthTimerElapsed msg))
    (cl:cons ':fligthTermination (fligthTermination msg))
    (cl:cons ':gpsTimeout (gpsTimeout msg))
    (cl:cons ':orbiting (orbiting msg))
    (cl:cons ':loopControl1 (loopControl1 msg))
    (cl:cons ':loopControl2 (loopControl2 msg))
    (cl:cons ':loopControl3 (loopControl3 msg))
    (cl:cons ':loopControl4 (loopControl4 msg))
    (cl:cons ':loopControl5 (loopControl5 msg))
    (cl:cons ':loopControl6 (loopControl6 msg))
    (cl:cons ':loopControl7 (loopControl7 msg))
    (cl:cons ':loopControl8 (loopControl8 msg))
    (cl:cons ':loopControlCount (loopControlCount msg))
    (cl:cons ':userAction0 (userAction0 msg))
    (cl:cons ':userAction1 (userAction1 msg))
    (cl:cons ':userAction2 (userAction2 msg))
    (cl:cons ':userAction3 (userAction3 msg))
    (cl:cons ':userAction4 (userAction4 msg))
    (cl:cons ':userAction5 (userAction5 msg))
    (cl:cons ':userAction6 (userAction6 msg))
    (cl:cons ':userAction7 (userAction7 msg))
))
