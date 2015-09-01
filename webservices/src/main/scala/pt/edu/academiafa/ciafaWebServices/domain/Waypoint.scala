package pt.edu.academiafa.ciafaWebServices.domain

import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.Tag

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
 * Mapped telemetry samples table object.
 */
class WaypointSamples(tag: Tag) extends Table[WaypointSample](tag,"WAYPOINT") {
  
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
  
  private type LocationTupleType = (Float,Float,Float)
  private type OrbitTupleType = (Boolean,Int,Int)
  private type WaypointSampleTupleType = (Option[Long],Long,Int,Int,LocationTupleType,OrbitTupleType,Int)

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
