package pt.edu.academiafa.ciafaWebServices.rest


import akka.actor.Actor
import akka.event.slf4j.SLF4JLogging
import pt.edu.academiafa.ciafaWebServices.dao.TelemetrySampleDAO
import pt.edu.academiafa.ciafaWebServices.domain._
import java.text.{ParseException, SimpleDateFormat}
import java.util.Date
import net.liftweb.json.Serialization._
import net.liftweb.json.{DateFormat, Formats}
import scala.Some
import spray.http._
import spray.httpx.unmarshalling._
import spray.routing._

/**
 * REST Service actor.
 */
class RestServiceActor extends Actor with RestService {

  implicit def actorRefFactory = context

  def receive = runRoute(rest)
}

/**
 * REST Service
 */
trait RestService extends HttpService with SLF4JLogging {

  val telemetryService = new TelemetrySampleDAO

  implicit val executionContext = actorRefFactory.dispatcher

  implicit val formats = net.liftweb.json.DefaultFormats

  implicit val customRejectionHandler = RejectionHandler {
    case rejections => mapHttpResponse {
      response =>
        response.withEntity(HttpEntity(ContentType(MediaTypes.`application/json`),
          write(Map("error" -> response.entity.asString))))
    } {
      RejectionHandler.Default(rejections)
    }
  }

  val rest = respondWithMediaType(MediaTypes.`application/json`) {
    path("telemetry") {
        get {
          parameters('telemetryId.as[Long]) {
            id: Long => {
              ctx: RequestContext =>
                handleRequest(ctx) {
                  log.debug("Searching for telemetry sample with id: %s".format(id))
                  telemetryService.get(id)
                }
            }
          }
        }
    } 
  }

  /**
   * Handles an incoming request and create valid response for it.
   *
   * @param ctx         request context
   * @param successCode HTTP Status code for success
   * @param action      action to perform
   */
  protected def handleRequest(ctx: RequestContext, successCode: StatusCode = StatusCodes.OK)(action: => Either[Failure, _]) {
    action match {
      case Right(result: Object) =>
        ctx.complete(successCode, write(result))
      case Left(error: Failure) =>
        ctx.complete(error.getStatusCode, net.liftweb.json.Serialization.write(Map("error" -> error.message)))
      case _ =>
        ctx.complete(StatusCodes.InternalServerError)
    }
  }
}
