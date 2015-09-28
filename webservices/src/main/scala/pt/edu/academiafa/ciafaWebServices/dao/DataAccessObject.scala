package pt.edu.academiafa.ciafaWebServices.dao


import pt.edu.academiafa.ciafaWebServices.config.Configuration
import pt.edu.academiafa.ciafaWebServices.domain._
import java.sql._
import scala.Some
import scala.slick.jdbc.JdbcBackend.Database.dynamicSession
import scala.slick.driver.MySQLDriver.simple._
import slick.jdbc.meta.MTable

class DataAccessObject extends Configuration with TelemetrySampleDataAccess with WaypointSampleDataAccess {

  // init Database instance
  protected val db = Database.forURL(url = "jdbc:mysql://%s:%d/%s".format(dbHost, dbPort, dbName), user = dbUser, password = dbPassword, driver = "com.mysql.jdbc.Driver")

  protected val telemetrySamples = TableQuery[TelemetrySamples]
  protected val waypointSamples = TableQuery[WaypointSamples]

  // create tables if not exist
  db.withDynSession {
    if (MTable.getTables("TELEMETRY").list().isEmpty) {
      telemetrySamples.ddl.create
    }
    if (MTable.getTables("WAYPOINT").list().isEmpty){
      waypointSamples.ddl.create
    }
  }
}




trait TelemetrySampleDataAccess  extends DatabaseErrorHandlers {
    /**
   * Saves telemetry sample entity into database.
   *
   * @param sample telemetry sample entity to
   * @return saved telemetry sample entity
   */
  protected implicit val db: Database
  protected implicit val telemetrySamples: TableQuery[TelemetrySamples]

  def createTelemetrySample(sample: TelemetrySample): Either[Failure, TelemetrySample] = {
    try {
      val id = db.withDynSession {
        telemetrySamples += sample
      }
      Right(sample.copy(id = Some(id)))
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

  /**
   * Deletes telemetry sample from database.
   *
   * @param id id of the telemetry sample to delete
   * @return deleted telemetry sample entity
   */
  def deleteTelemetrySample(id: Long): Either[Failure, TelemetrySample] = {
    try {
      db.withDynTransaction {
        val query = telemetrySamples.where(_.id === id)
        val samplesQ = query.run.asInstanceOf[List[TelemetrySample]]
        samplesQ.size match {
          case 0 =>
            Left(telemetrySampleNotFoundError(id))
          case _ => {
            query.delete
            Right(samplesQ.head)
          }
        }
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

  /**
   * Retrieves specific telemetry sample from database.
   *
   * @param id id of the telemetry sample to retrieve
   * @return telemetry sample entity with specified id
   */
  def getTelemetrySample(id: Long): Either[Failure, TelemetrySample] = {
    try {
      db.withDynSession {
        telemetrySamples.where(_.id === id).firstOption match {
          case Some(sample: TelemetrySample) =>
            Right(sample)
          case _ =>
            Left(telemetrySampleNotFoundError(id))
        }
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

    /**
   * Retrieves last telemetry sample from database.
   *
   * @return last telemetry sample entity 
   */
  def getLastTelemetrySample: Either[Failure, TelemetrySample] = {
    try {
      db.withDynSession {
        if (telemetrySamples.list.length > 0){
          Right(telemetrySamples.list.last)
        } else {
          Left(telemetrySampleTableEmpty)
        }
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }
}

trait WaypointSampleDataAccess extends DatabaseErrorHandlers {
  
  protected implicit val db: Database
  protected implicit val waypointSamples: TableQuery[WaypointSamples]

    /**
   * Saves waypoint sample entity into database.
   *
   * @param sample waypoint sample entity to
   * @return saved waypoint sample entity
   */
  def createWaypointSample(sample: WaypointSample): Either[Failure, WaypointSample] = {
    try {
      val id = db.withDynSession {
        waypointSamples += sample
      }
      Right(sample.copy(id = Some(id)))
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

  /**
   * Deletes waypoint sample from database.
   *
   * @param id id of the waypoint sample to delete
   * @return deleted waypoint sample entity
   */
  def deleteWaypointSample(id: Long): Either[Failure, WaypointSample] = {
    try {
      db.withDynTransaction {
        val query = waypointSamples.where(_.id === id)
        val samplesQ = query.run.asInstanceOf[List[WaypointSample]]
        samplesQ.size match {
          case 0 =>
            Left(waypointSampleNotFoundError(id))
          case _ => {
            query.delete
            Right(samplesQ.head)
          }
        }
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

  /**
   * Retrieves specific waypoint sample from database.
   *
   * @param id id of the waypoint sample to retrieve
   * @return waypoint sample entity with specified id
   */
  def getLastWaypointSampleWithIndex(i: Int): Either[Failure, WaypointSample] = {
    try {
      db.withDynSession {
        val wps = waypointSamples.where(_.index === i).list
        if (wps.size > 0) 
          Right(wps.last)
        else
          Left(waypointSampleNotFoundError(i))
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }
}


trait DatabaseErrorHandlers {
  /**
   * Produce database error description.
   *
   * @param e SQL Exception
   * @return database error description
   */
  protected def databaseError(e: SQLException) =
    Failure("%d: %s".format(e.getErrorCode, e.getMessage), FailureType.DatabaseFailure)

  /**
   * Produce sample not found error description.
   *
   * @param sampleId id of the sample
   * @return not found error description
   */
  protected def waypointSampleNotFoundError(sampleId: Long) =
    Failure("Waypoint sample with id=%d does not exist".format(sampleId), FailureType.NotFound)

    /**
   * Produce sample not found error description.
   *
   * @param sampleId id of the sample
   * @return not found error description
   */
  protected def telemetrySampleNotFoundError(sampleId: Long) =
    Failure("Telemetry sample with id=%d does not exist".format(sampleId), FailureType.NotFound)


  protected def telemetrySampleTableEmpty =
    Failure("Telemetry sample table is empty", FailureType.NotFound)
  
}
