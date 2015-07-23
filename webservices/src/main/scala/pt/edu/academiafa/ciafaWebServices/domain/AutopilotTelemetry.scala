package pt.edu.academiafa.ciafaWebServices.domain

import scala.slick.driver.MySQLDriver.simple._

/**
  * AutopilotTelemetry entity.
  *
  * @param vehicleId vehicle id
  * @param location lat lon position (WGS-84)
  * @param altitude altitude
  * @param ias indicated airspeed
  * @param gs ground speed (north, east, down)
  * @param attitude roll, pitch and yaw angles
  * @param barometricAltitude barometric altitude
  * @param wind wind velocity (south and west components)
  * @param rpm left and right engine RPM
  * @param staticPressure static pressure
  * @param acceleration (x, y, and z components)
  * @param compass heading
  * @param agl altitude AGL
  * @param timestamp GMT posix timestamp converted from gps time 
  */

case class Coordinates(
  lat: Float,
  long: Float
)

case class GroundSpeed(
  north: Int,
  east: Int,
  down: Int
)

case class Attitude(
  roll: Int,
  pitch: Int,
  yaw: Int
)

case class Wind(
  south: Float,
  west: Float
)

case class RPM(
  left: Int,
  right: Int
)

case class Acceleration(
  x: Int,
  y: Int,
  z: Int
)

case class AutopilotTelemetry(
  timestamp: Int,
  vehicleId: Int,
  location: Coordinates,
  altitude: Float, 
  ias: Int,
  gs: GroundSpeed,
  attitude: Attitude,
  barometricAltitude: Int, 
  wind: Wind, 
  rpm: RPM,
  staticPressure: Int, 
  acceleration: Acceleration, 
  compass: Int, 
  agl: Int
)

/**
 * Mapped telemetry samples table object.
 */
// object TelemetrySamples extends Table[AutopilotTelemetry]("telemetrySamples") {

//   def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

//   def firstName = column[String]("first_name")

//   def lastName = column[String]("last_name")

//   def birthday = column[java.util.Date]("birthday", O.Nullable)

//   def * = id.? ~ firstName ~ lastName ~ birthday.? <>(Customer, Customer.unapply _)

//   implicit val dateTypeMapper = MappedTypeMapper.base[java.util.Date, java.sql.Date](
//   {
//     ud => new java.sql.Date(ud.getTime)
//   }, {
//     sd => new java.util.Date(sd.getTime)
//   })

//   val findById = for {
//     id <- Parameters[Long]
//     c <- this if c.id is id
//   } yield c
// }
