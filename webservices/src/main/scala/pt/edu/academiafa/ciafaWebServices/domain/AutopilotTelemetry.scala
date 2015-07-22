package pt.edu.academiafa.ciafaWebServices.domain

import scala.slick.driver.MySQLDriver.simple._

/**
  * AutopilotTelemetry entity.
  *
  * @param vehicleId vehicle id
  * @param latitude latitude
  * @param longitude longitude
  * @param altitude altitude
  * @param ias indicated airspeed
  * @param vx x-axis speed (inertial frame)
  * @param vy y-axis speed (inertial frame)
  * @param vz z-axis speed (inertial frame)
  * @param roll roll angle
  * @param pitch pitch angle
  * @param yaw yaw angle
  * @param barometricAltitude barometric altitude
  * @param windSouth wind speed (south component)
  * @param windWest wind speed (west component)
  * @param leftRPM left engine RPM
  * @param rightRPM right engine RPM
  * @param staticPressure static pressure
  * @param accelX x-axis acceleration
  * @param accelY y-axis acceleration
  * @param accelZ z-axis acceleration
  * @param compass heading
  * @param agl altitude AGL
  * @param timestamp GMT posix timestamp converted from gps time 
  */

case class GPSCoordinates(
  latitude: Float,
  longitude: Float
)

case class AutopilotTelemetry(
  vehicleId: Int,
  location: GPSCoordinates,
  altitude: Float, 
  ias: Int,
  vx: Int,
  vy: Int,
  vz: Int, 
  roll: Int,
  pitch: Int,
  yaw: Float, 
  barometricAltitude: Int, 
  windSouth: Float,
  windWest: Float, 
  leftRPM: Int, 
  rightRPM: Int, 
  staticPressure: Int, 
  accelX: Int, 
  accelY: Int, 
  accelZ: Int, 
  compass: Int, 
  agl: Int, 
  timestamp: Int
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
