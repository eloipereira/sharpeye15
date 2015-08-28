package pt.edu.academiafa.ciafaWebServices.dao

import pt.edu.academiafa.ciafaWebServices.config.Configuration
import pt.edu.academiafa.ciafaWebServices.domain._
import java.sql._
import scala.Some
import scala.slick.jdbc.JdbcBackend.Database.dynamicSession
import scala.slick.driver.MySQLDriver.simple._
import slick.jdbc.meta.MTable

class TelemetrySampleDAO extends Configuration {

  // init Database instance
  private val db = Database.forURL(url = "jdbc:mysql://%s:%d/%s".format(dbHost, dbPort, dbName),
    user = dbUser, password = dbPassword, driver = "com.mysql.jdbc.Driver")

  val samples = TableQuery[TelemetrySamples]

  def findById(id: Long) = samples.filter(_.id === id)

  // create tables if not exist
  db.withDynSession {
    if (MTable.getTables("TELEMETRY").list().isEmpty) {
      println("CREATE TABLE")
      samples.ddl.create
    }
  }

  /**
   * Saves telemetry sample entity into database.
   *
   * @param sample telemetry sample entity to
   * @return saved telemetry sample entity
   */
  def create(sample: TelemetrySample): Either[Failure, TelemetrySample] = {
    try {
      val id = db.withDynSession {
        samples += sample
      }
      Right(sample.copy(id = Some(id)))
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

  /**
   * Updates telemetry sample entity with specified one.
   *
   * @param id       id of the telemetry sample to update.
   * @param sample updated telemetry sample entity
   * @return updated telemetry sample entity
   */
  def update(id: Long, sample: TelemetrySample): Either[Failure, TelemetrySample] = {
    try
      db.withDynSession {
        samples.where(_.id === id) update sample.copy(id = Some(id)) match {
          case 0 => Left(notFoundError(id))
          case _ => Right(sample.copy(id = Some(id)))
        }
      }
    catch {
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
  def delete(id: Long): Either[Failure, TelemetrySample] = {
    try {
      db.withDynTransaction {
        val query = samples.where(_.id === id)
        val samplesQ = query.run.asInstanceOf[List[TelemetrySample]]
        samplesQ.size match {
          case 0 =>
            Left(notFoundError(id))
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
  def get(id: Long): Either[Failure, TelemetrySample] = {
    try {
      db.withDynSession {
        findById(id).firstOption match {
          case Some(sample: TelemetrySample) =>
            Right(sample)
          case _ =>
            Left(notFoundError(id))
        }
      }
    } catch {
      case e: SQLException =>
        Left(databaseError(e))
    }
  }

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
  protected def notFoundError(sampleId: Long) =
    Failure("TelemetrySample with id=%d does not exist".format(sampleId), FailureType.NotFound)
}
