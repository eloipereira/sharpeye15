; Auto-generated. Do not edit!


(cl:in-package seagull_autopilot_msgs-msg)


;//! \htmlinclude AutopilotTelemetry.msg.html

(cl:defclass <AutopilotTelemetry> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type seagull_commons_msgs-msg:SeagullHeader
    :initform (cl:make-instance 'seagull_commons_msgs-msg:SeagullHeader))
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (ias
    :reader ias
    :initarg :ias
    :type cl:fixnum
    :initform 0)
   (vx
    :reader vx
    :initarg :vx
    :type cl:fixnum
    :initform 0)
   (vy
    :reader vy
    :initarg :vy
    :type cl:fixnum
    :initform 0)
   (vz
    :reader vz
    :initarg :vz
    :type cl:fixnum
    :initform 0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:fixnum
    :initform 0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:fixnum
    :initform 0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (barometricAltitude
    :reader barometricAltitude
    :initarg :barometricAltitude
    :type cl:fixnum
    :initform 0)
   (windSouth
    :reader windSouth
    :initarg :windSouth
    :type cl:float
    :initform 0.0)
   (windWest
    :reader windWest
    :initarg :windWest
    :type cl:float
    :initform 0.0)
   (leftRPM
    :reader leftRPM
    :initarg :leftRPM
    :type cl:fixnum
    :initform 0)
   (rightRPM
    :reader rightRPM
    :initarg :rightRPM
    :type cl:fixnum
    :initform 0)
   (staticPressure
    :reader staticPressure
    :initarg :staticPressure
    :type cl:fixnum
    :initform 0)
   (accelX
    :reader accelX
    :initarg :accelX
    :type cl:fixnum
    :initform 0)
   (accelY
    :reader accelY
    :initarg :accelY
    :type cl:fixnum
    :initform 0)
   (accelZ
    :reader accelZ
    :initarg :accelZ
    :type cl:fixnum
    :initform 0)
   (compass
    :reader compass
    :initarg :compass
    :type cl:fixnum
    :initform 0)
   (agl
    :reader agl
    :initarg :agl
    :type cl:fixnum
    :initform 0)
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (fuel
    :reader fuel
    :initarg :fuel
    :type cl:float
    :initform 0.0))
)

(cl:defclass AutopilotTelemetry (<AutopilotTelemetry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutopilotTelemetry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutopilotTelemetry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seagull_autopilot_msgs-msg:<AutopilotTelemetry> is deprecated: use seagull_autopilot_msgs-msg:AutopilotTelemetry instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:header-val is deprecated.  Use seagull_autopilot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:latitude-val is deprecated.  Use seagull_autopilot_msgs-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:longitude-val is deprecated.  Use seagull_autopilot_msgs-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:altitude-val is deprecated.  Use seagull_autopilot_msgs-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'ias-val :lambda-list '(m))
(cl:defmethod ias-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:ias-val is deprecated.  Use seagull_autopilot_msgs-msg:ias instead.")
  (ias m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:vx-val is deprecated.  Use seagull_autopilot_msgs-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:vy-val is deprecated.  Use seagull_autopilot_msgs-msg:vy instead.")
  (vy m))

(cl:ensure-generic-function 'vz-val :lambda-list '(m))
(cl:defmethod vz-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:vz-val is deprecated.  Use seagull_autopilot_msgs-msg:vz instead.")
  (vz m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:roll-val is deprecated.  Use seagull_autopilot_msgs-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:pitch-val is deprecated.  Use seagull_autopilot_msgs-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:yaw-val is deprecated.  Use seagull_autopilot_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'barometricAltitude-val :lambda-list '(m))
(cl:defmethod barometricAltitude-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:barometricAltitude-val is deprecated.  Use seagull_autopilot_msgs-msg:barometricAltitude instead.")
  (barometricAltitude m))

(cl:ensure-generic-function 'windSouth-val :lambda-list '(m))
(cl:defmethod windSouth-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:windSouth-val is deprecated.  Use seagull_autopilot_msgs-msg:windSouth instead.")
  (windSouth m))

(cl:ensure-generic-function 'windWest-val :lambda-list '(m))
(cl:defmethod windWest-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:windWest-val is deprecated.  Use seagull_autopilot_msgs-msg:windWest instead.")
  (windWest m))

(cl:ensure-generic-function 'leftRPM-val :lambda-list '(m))
(cl:defmethod leftRPM-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:leftRPM-val is deprecated.  Use seagull_autopilot_msgs-msg:leftRPM instead.")
  (leftRPM m))

(cl:ensure-generic-function 'rightRPM-val :lambda-list '(m))
(cl:defmethod rightRPM-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:rightRPM-val is deprecated.  Use seagull_autopilot_msgs-msg:rightRPM instead.")
  (rightRPM m))

(cl:ensure-generic-function 'staticPressure-val :lambda-list '(m))
(cl:defmethod staticPressure-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:staticPressure-val is deprecated.  Use seagull_autopilot_msgs-msg:staticPressure instead.")
  (staticPressure m))

(cl:ensure-generic-function 'accelX-val :lambda-list '(m))
(cl:defmethod accelX-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:accelX-val is deprecated.  Use seagull_autopilot_msgs-msg:accelX instead.")
  (accelX m))

(cl:ensure-generic-function 'accelY-val :lambda-list '(m))
(cl:defmethod accelY-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:accelY-val is deprecated.  Use seagull_autopilot_msgs-msg:accelY instead.")
  (accelY m))

(cl:ensure-generic-function 'accelZ-val :lambda-list '(m))
(cl:defmethod accelZ-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:accelZ-val is deprecated.  Use seagull_autopilot_msgs-msg:accelZ instead.")
  (accelZ m))

(cl:ensure-generic-function 'compass-val :lambda-list '(m))
(cl:defmethod compass-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:compass-val is deprecated.  Use seagull_autopilot_msgs-msg:compass instead.")
  (compass m))

(cl:ensure-generic-function 'agl-val :lambda-list '(m))
(cl:defmethod agl-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:agl-val is deprecated.  Use seagull_autopilot_msgs-msg:agl instead.")
  (agl m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:timestamp-val is deprecated.  Use seagull_autopilot_msgs-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'fuel-val :lambda-list '(m))
(cl:defmethod fuel-val ((m <AutopilotTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seagull_autopilot_msgs-msg:fuel-val is deprecated.  Use seagull_autopilot_msgs-msg:fuel instead.")
  (fuel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutopilotTelemetry>) ostream)
  "Serializes a message object of type '<AutopilotTelemetry>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ias)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ias)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'vx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'vy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'vz)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'roll)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'barometricAltitude)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'windSouth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'windWest))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'leftRPM)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'leftRPM)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rightRPM)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rightRPM)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'staticPressure)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'staticPressure)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'accelX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'accelY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'accelZ)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'compass)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'compass)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'agl)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'agl)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fuel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutopilotTelemetry>) istream)
  "Deserializes a message object of type '<AutopilotTelemetry>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ias)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'ias)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vx) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vy) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vz) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'roll) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'barometricAltitude) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'windSouth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'windWest) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'leftRPM)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'leftRPM)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rightRPM)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rightRPM)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'staticPressure)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'staticPressure)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'accelX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'accelY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'accelZ) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'compass)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'compass)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'agl)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'agl)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fuel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutopilotTelemetry>)))
  "Returns string type for a message object of type '<AutopilotTelemetry>"
  "seagull_autopilot_msgs/AutopilotTelemetry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutopilotTelemetry)))
  "Returns string type for a message object of type 'AutopilotTelemetry"
  "seagull_autopilot_msgs/AutopilotTelemetry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutopilotTelemetry>)))
  "Returns md5sum for a message object of type '<AutopilotTelemetry>"
  "645d93bf5a3523d02fe4719dbe79be4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutopilotTelemetry)))
  "Returns md5sum for a message object of type 'AutopilotTelemetry"
  "645d93bf5a3523d02fe4719dbe79be4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutopilotTelemetry>)))
  "Returns full string definition for message of type '<AutopilotTelemetry>"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%float32 latitude~%float32 longitude~%float32 altitude~%uint16 ias~%int16 vx~%int16 vy~%int16 vz~%int16 roll~%int16 pitch~%float32 yaw~%int16 barometricAltitude~%float32 windSouth~%float32 windWest~%uint16 leftRPM~%uint16 rightRPM~%uint16 staticPressure~%int16 accelX~%int16 accelY~%int16 accelZ~%uint16 compass~%uint16 agl~%uint64 timestamp #GMT posix timestamp converted from gps time ~%float32 fuel~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutopilotTelemetry)))
  "Returns full string definition for message of type 'AutopilotTelemetry"
  (cl:format cl:nil "seagull_commons_msgs/SeagullHeader header~%float32 latitude~%float32 longitude~%float32 altitude~%uint16 ias~%int16 vx~%int16 vy~%int16 vz~%int16 roll~%int16 pitch~%float32 yaw~%int16 barometricAltitude~%float32 windSouth~%float32 windWest~%uint16 leftRPM~%uint16 rightRPM~%uint16 staticPressure~%int16 accelX~%int16 accelY~%int16 accelZ~%uint16 compass~%uint16 agl~%uint64 timestamp #GMT posix timestamp converted from gps time ~%float32 fuel~%================================================================================~%MSG: seagull_commons_msgs/SeagullHeader~%Header header~%uint16 vehicleId~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutopilotTelemetry>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     2
     2
     2
     2
     2
     2
     4
     2
     4
     4
     2
     2
     2
     2
     2
     2
     2
     2
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutopilotTelemetry>))
  "Converts a ROS message object to a list"
  (cl:list 'AutopilotTelemetry
    (cl:cons ':header (header msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':ias (ias msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
    (cl:cons ':vz (vz msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':barometricAltitude (barometricAltitude msg))
    (cl:cons ':windSouth (windSouth msg))
    (cl:cons ':windWest (windWest msg))
    (cl:cons ':leftRPM (leftRPM msg))
    (cl:cons ':rightRPM (rightRPM msg))
    (cl:cons ':staticPressure (staticPressure msg))
    (cl:cons ':accelX (accelX msg))
    (cl:cons ':accelY (accelY msg))
    (cl:cons ':accelZ (accelZ msg))
    (cl:cons ':compass (compass msg))
    (cl:cons ':agl (agl msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':fuel (fuel msg))
))
