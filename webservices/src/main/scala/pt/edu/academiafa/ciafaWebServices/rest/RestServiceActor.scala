package pt.edu.academiafa.ciafaWebServices.rest


import akka.actor.Actor
import akka.event.slf4j.SLF4JLogging
import pt.edu.academiafa.ciafaWebServices.dao.DataAccessObject
import pt.edu.academiafa.ciafaWebServices.domain._
import java.text.{ParseException, SimpleDateFormat}
import java.util.Date
import net.liftweb.json.Serialization._
import net.liftweb.json.{DateFormat, Formats}
import scala.Some
import spray.http._
import spray.httpx.unmarshalling._
import spray.routing._
import spray.http.HttpHeaders.RawHeader

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

  val daoService = new DataAccessObject

  implicit val executionContext = actorRefFactory.dispatcher

  implicit val formats = net.liftweb.json.DefaultFormats

  /**
   * Handles rejections in Json format 
   */
  implicit val customRejectionHandler = RejectionHandler {
    case rejections => mapHttpResponse {
      response =>
        response.withEntity(HttpEntity(ContentType(MediaTypes.`application/json`),
          write(Map("error" -> response.entity.asString))))
    } {
      RejectionHandler.Default(rejections)
    }
  }

  val rest = 
  respondWithHeader(RawHeader("Access-Control-Allow-Origin", "*")) {
    respondWithMediaType(MediaTypes.`application/json`) {
      path("telemetry") {
        get {
          parameters('id.as[Long].?) {
            id: Option[Long] => {
              ctx: RequestContext =>
              handleRequest(ctx) {
                id match {
                  case None => {
                    log.debug("[RestServiceActor]: Searching for last telemetry sample")
                    daoService.getLastTelemetrySample
                  }
                  case Some(i) => {
                    log.debug("[RestServiceActor]: Searching for telemetry sample with id: %s".format(i))
                    daoService.getTelemetrySample(i)
                  }
                }
              }
            }
          }
        }
      } ~
      path("waypoint") {
        get {
          parameters('index.as[Int]) {
            index: Int => {
              ctx: RequestContext =>
              handleRequest(ctx) {
                log.debug("[RestServiceActor]: Searching for last the last waypoint sample with index: %s".format(index))
                daoService.getLastWaypointSampleWithIndex(index)
              }
            }
          }
        }
      }
    } ~
    path("trajectory"){
      parameters('vId.as[Int]){
        vId: Int =>{
          ctx: RequestContext => {
            handleRequest(ctx){
              daoService.getTrajectoryOfVehicle(vId)
            }
          }
        }
      }
    } ~
    path("webApp"){
      getFromResource("web/index.html")
    } ~ {
      getFromResourceDirectory("web")
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
