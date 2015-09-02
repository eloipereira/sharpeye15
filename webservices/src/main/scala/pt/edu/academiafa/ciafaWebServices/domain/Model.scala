package pt.edu.academiafa.ciafaWebServices.domain

/**
  * TelemetrySample entity.
  *
  * @param id telemetry id
  * @param vId vehicle id
  * @param loc location parameters (lat, lon, alt)
  * @param ias indicated airspeed
  * @param gs ground speed (NED coordinates)
  * @param att attitude (roll, pitch, yaw angles)
  * @param wind wind speed (south and west components)
  * @param engine engine properties
  * @param accel acceleration (x,y,z)
  * @param heading heading
  * @param agl altitude AGL
  * @param timestamp GMT posix timestamp converted from gps time 
  */

case class TelemetrySample(
  id: Option[Long],
  timestamp: Long,
  vId: Int,
  loc: Location,
  ias: Int,
  gs: GroundSpeed,
  att: Attitude,
  wind: Wind,
  engine: Engine,
  accel: Acceleration,
  heading: Int,
  agl: Int,
  track: Tracker
)

/**
  * Waypoint Sample entity.
  * 
  * @param id waypoint sample id
  * @param index waypoint index
  * @param vId vehicle id
  * @param loc location parameters
  * @param orbit orbit parameters 
  * @param next next waypoint index
  * @param timestamp GMT posix timestamp converted from gps time 
  */

case class WaypointSample(
  id: Option[Long],
  timestamp: Long,
  index: Int,
  vId: Int,
  loc: Location,
  orbit: Orbit,
  next: Int
)

/**
  * Location entity.
  * 
  * @param lat latitude
  * @param lon longitude
  * @param alt altitude
  */

case class Location(
  lat: Float,
  lon: Float,
  alt: Float
)

/**
  * GroundSpeed entity.
  * 
  * @param north north component
  * @param east east component
  * @param down down component
  */

case class GroundSpeed(
  north: Int,
  east: Int,
  down: Int
)

/**
  * Attitude entity.
  * 
  * @param roll roll angle
  * @param pitch pitch angle
  * @param yaw yaw angle
  */

case class Attitude(
  roll: Int,
  pitch: Int,
  yaw: Float
)

/**
  * Wind entity.
  * 
  * @param south south component
  * @param west west component
  */

case class Wind(
  south: Float,
  west: Float
)

/**
  * Engine entity.
  * 
  * @param rpmL left engine rpm
  * @param rpmR right engine rpm
  */

case class Engine(
  rpmL: Int,
  rpmR: Int
)


/**
  * Acceleration entity.
  * 
  * @param x x-axis acceleration
  * @param y y-axis acceleration
  * @param z z-axis acceleration
  */

case class Acceleration(
  x: Int,
  y: Int,
  z: Int
)


/**
  * Orbit entity.
  * 
  * @param orbitRight orbit is clockwise?
  * @param orbitRadius orbit radius
  * @param orbitTime orbit time (0 if manually determined by operator)
  */

case class Orbit(
  orbitRight: Boolean,
  orbitRadius: Int,
  orbitTime: Int
)

/**
  * Tracker entity.
  * 
  * @param status set if tracker is active
  * @param orbiting set if system is orbiting
  * @param from index of the "from" waypoint 
  * @param to index of the "to" waypoint 
  * @param eta estimated time of arrival in seconds
  */

case class Tracker(
  status: Boolean,
  orbiting: Boolean,
  from: Short,
  to: Short,
  eta: Int
)
