package pt.edu.academiafa.ciafaWebServices.domain

import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.Tag

/**
 * Mapped telemetry samples table object.
 */
class TelemetrySamples(tag: Tag) extends Table[TelemetrySample](tag,"TELEMETRY") with TupleTypes {

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
  def status = column[Boolean]("TRACKER_STATUS")
  def orbiting = column[Boolean]("ORBITING")
  def from = column[Short]("FROM_WP")
  def to = column[Short]("TO_WP")
  def eta = column[Int]("ETA")
  def fuel = column[Float]("FUEL")
  def * = telemetrySampleValue <> (toModel,toTuple)

  private val telemetrySampleValue = (
    id.?,
    timestamp,
    vId,
    (lat,lon,alt),
    ias,
    (gsN,gsE,gsD),
    (roll,pitch,yaw),
    (windS,windW),
    (rpmL,rpmR),
    (accelX,accelY,accelZ),
    compass,
    agl,
    (status,orbiting,from,to,eta),
    fuel
  )

  private val toModel: TelemetrySampleTupleType => TelemetrySample = { telTuple =>
    TelemetrySample(
      telTuple._1,
      telTuple._2,
      telTuple._3,
      Location.tupled.apply(telTuple._4),
      telTuple._5,
      GroundSpeed.tupled.apply(telTuple._6),
      Attitude.tupled.apply(telTuple._7),
      Wind.tupled.apply(telTuple._8),
      Engine.tupled.apply(telTuple._9),
      Acceleration.tupled.apply(telTuple._10),
      telTuple._11,
      telTuple._12,
      Tracker.tupled.apply(telTuple._13),
      telTuple._14
    )
  }

  private val toTuple: TelemetrySample => Option[TelemetrySampleTupleType] = { tel =>
    Some { 
      (
        tel.id,
        tel.timestamp,
        tel.vId,
        Location.unapply(tel.loc).get,
        tel.ias,
        GroundSpeed.unapply(tel.gs).get,
        Attitude.unapply(tel.att).get,
        Wind.unapply(tel.wind).get,
        Engine.unapply(tel.engine).get,
        Acceleration.unapply(tel.accel).get,
        tel.heading,
        tel.agl,
        Tracker.unapply(tel.track).get,
        tel.fuel
      )
    }
  }

}

/**
 * Mapped waypoint samples table object.
 */
class WaypointSamples(tag: Tag) extends Table[WaypointSample](tag,"WAYPOINT") with TupleTypes {
  
  def id = column[Option[Long]]("WP_SAMPLE_ID", O.PrimaryKey, O.AutoInc)
  def timestamp = column[Long]("TIMESTAMP")
  def index = column[Int]("INDEX")
  def vId = column[Int]("VEHICLE_ID")
  def lat = column[Float]("LAT")
  def lon = column[Float]("LON")
  def alt = column[Float]("ALT")
  def orbitRight = column[Boolean]("ORBIT_RIGHT")
  def orbitRadius = column[Int]("ORBIT_RADIUS")
  def orbitTime = column[Int]("ORBIT_TIME")
  def next = column[Int]("NEXT")

  // Projection
  def * = waypointSampleValue <> (toModel,toTuple)

  private val waypointSampleValue = (
    id,
    timestamp,
    index,
    vId,
    (lat,lon,alt),
    (orbitRight,orbitRadius,orbitTime),
    next).shaped[WaypointSampleTupleType]

  private val toModel: WaypointSampleTupleType => WaypointSample = { wpTuple =>
      WaypointSample(
        wpTuple._1,
        wpTuple._2,
        wpTuple._3,
        wpTuple._4,
        Location.tupled.apply(wpTuple._5),
        Orbit.tupled.apply(wpTuple._6),
        wpTuple._7)
  }

  private val toTuple: WaypointSample => Option[WaypointSampleTupleType] = { wp =>
    Some {
      (
        wp.id,
        wp.timestamp,
        wp.index,
        wp.vId,
        (Location.unapply(wp.loc).get),
        (Orbit.unapply(wp.orbit).get),
        wp.next
      )
    }
  }
}

trait TupleTypes {

  protected type LocationTupleType = (Float,Float,Float)
  protected type GroundSpeedTupleType = (Int,Int,Int)
  protected type AttitudeTupleType = (Int,Int,Float)
  protected type WindTupleType = (Float,Float)
  protected type EngineTupleType = (Int,Int)
  protected type AccelerationTupleType = (Int,Int,Int)
  protected type TrackerTupleType = (Boolean,Boolean,Short,Short,Int)
  protected type TelemetrySampleTupleType = (Option[Long],Long,Int,LocationTupleType,Int,GroundSpeedTupleType,AttitudeTupleType,WindTupleType,EngineTupleType,AccelerationTupleType,Int,Int,TrackerTupleType,Float)
  protected type OrbitTupleType = (Boolean,Int,Int)
  protected type WaypointSampleTupleType = (Option[Long],Long,Int,Int,LocationTupleType,OrbitTupleType,Int)

}
