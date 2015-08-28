package pt.edu.academiafa.ciafaWebServices.domain

import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.Tag

/**
  * TelemetrySample entity.
  *
  * @param id telemetry id
  * @param vId vehicle id
  * @param lat latitude 
  * @param lon longitude
  * @param alt altitude
  * @param ias indicated airspeed
  * @param gsN ground speed (north component)
  * @param gsE ground speed (east component)
  * @param gsD ground speed (down component)
  * @param roll roll angle
  * @param pitch pitch angle
  * @param yaw yaw angle
  * @param windS wind speed (South component)
  * @param windW wind speed (West component)
  * @param rpmL left engine RPM
  * @param rpmR right engine RPM
  * @param accelX acceleration (x-axis)
  * @param accelY acceleration (y-axis)
  * @param accelZ acceleration (z-axis)
  * @param compass heading
  * @param agl altitude AGL
  * @param timestamp GMT posix timestamp converted from gps time 
  */

case class TelemetrySample(
  id: Option[Long],
  timestamp: Long,
  vId: Int,
  lat: Float,
  lon: Float,
  alt: Float,
  ias: Int,
  gsN: Int,
  gsE: Int,
  gsD: Int,
  roll: Int,
  pitch: Int,
  yaw: Float,
  windS: Float,
  windW: Float,
  rpmL: Int,
  rpmR: Int,
  accelX: Int,
  accelY: Int,
  accelZ: Int,
  compass: Int,
  agl: Int
)
 

/**
 * Mapped telemetry samples table object.
 */
class TelemetrySamples(tag: Tag) extends Table[TelemetrySample](tag,"TELEMETRY") {

  def id = column[Long]("TEL_ID", O.PrimaryKey, O.AutoInc)
  def timestamp = column[Long]("TIMESTAMP")
  def vId = column[Int]("VEHICLE_ID")
  def lat = column[Float]("LAT")
  def lon = column[Float]("LON")
  def alt = column[Float]("ALT")
  def ias = column[Int]("IAS")
  def gsN = column[Int]("GS_N")
  def gsE = column[Int]("GS_E")
  def gsD = column[Int]("GS_D")
  def roll = column[Int]("ROLL")
  def pitch = column[Int]("PITCH")
  def yaw = column[Float]("YAW")
  def windS = column[Float]("WIND_S")
  def windW = column[Float]("WIND_W")
  def rpmL = column[Int]("RPM_L")
  def rpmR = column[Int]("RPM_R")
  def accelX = column[Int]("ACCEL_X")
  def accelY = column[Int]("ACCEL_Y")
  def accelZ = column[Int]("ACCEL_Z")
  def compass = column[Int]("HEADING")
  def agl = column[Int]("AGL")
  def * = (id.?,timestamp,vId,lat,lon,alt,ias,gsN,gsE,gsD,roll,pitch,yaw,windS,windW,rpmL,rpmR,accelX,accelY,accelZ,compass,agl) <> (TelemetrySample.tupled,TelemetrySample.unapply)

}

// object TelemetrySamples {
//   lazy val samples = TableQuery[TelemetrySamples]
//   def findById(id: Long) = samples.filter(_.id === id)
// }
