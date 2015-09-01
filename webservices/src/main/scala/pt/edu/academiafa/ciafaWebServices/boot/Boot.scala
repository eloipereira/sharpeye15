package pt.edu.academiafa.ciafaWebServices.boot

import akka.actor.{Props, ActorSystem}
import akka.io.IO
import pt.edu.academiafa.ciafaWebServices.config.Configuration
import pt.edu.academiafa.ciafaWebServices.rest.RestServiceActor
import pt.edu.academiafa.ciafaWebServices.ros._
import spray.can.Http
import org.ros.node.{DefaultNodeMainExecutor, NodeMainExecutor}


object Boot extends App with Configuration {

  // start ROS telemetry node 
  val executor: NodeMainExecutor = DefaultNodeMainExecutor.newDefault
  executor.execute(new VehicleNode, rosConfiguration)

  // create an actor system for application
  implicit val system = ActorSystem("rest-service")

  // create and start rest service actor
  val restService = system.actorOf(Props[RestServiceActor], "rest-endpoint")

  // start HTTP server with rest service actor as a handler
  IO(Http) ! Http.Bind(restService, serviceHost, servicePort)
}
