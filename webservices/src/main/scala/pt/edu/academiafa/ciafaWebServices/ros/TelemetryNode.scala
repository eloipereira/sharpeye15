package pt.edu.academiafa.ciafaWebServices.ros

import org.ros.message.MessageListener
import org.ros.namespace.GraphName
import org.ros.node.AbstractNodeMain
import org.ros.node.ConnectedNode
import org.ros.node.NodeMain
import org.ros.node.topic.Subscriber
import org.ros.node.topic.Publisher
import org.apache.commons.logging.Log

import seagull_autopilot_msgs.AutopilotADCSamples
import seagull_autopilot_msgs.AutopilotTelemetry
import seagull_autopilot_msgs.AutopilotWaypoint
import seagull_autopilot_msgs.AutopilotStatus
import seagull_autopilot_msgs.AutopilotRequestWaypoints
import org.ros.concurrent.CancellableLoop
import seagull_commons_msgs.SeagullHeader

import pt.edu.academiafa.ciafaWebServices.domain._
import pt.edu.academiafa.ciafaWebServices.dao._

class VehicleNode extends AbstractNodeMain{

  
  var time: Long = 0
  var vehicleId: Short = 0
  var status = false
  var orbiting = false
  var from:Short = 0
  var to:Short = 0 
  var eta = 0
  var gotStatus = false
  val daoService = new DataAccessObject
  override def getDefaultNodeName: GraphName = GraphName.of("vehicleNode")
  override def onStart(connectedNode: ConnectedNode): Unit = {
    val log: Log = connectedNode.getLog
    val telemetrySub: Subscriber[AutopilotTelemetry] = connectedNode.newSubscriber("autopilot_telemetry", AutopilotTelemetry._TYPE)
    telemetrySub.addMessageListener(new MessageListener[AutopilotTelemetry] {
      override def onNewMessage(msg: AutopilotTelemetry): Unit = {
        log.info("[VehicleNode]: received new telemetry message from vehicle " +  msg.getHeader.getVehicleId)
        if (gotStatus){
        time = msg.getTimestamp
        vehicleId = msg.getHeader.getVehicleId 
        val sample = TelemetrySample(
          None,
          time,
          vehicleId, 
          Location(
            msg.getLatitude,
            msg.getLongitude,
            msg.getAltitude),
          msg.getIas,
          GroundSpeed(
            msg.getVx,
            msg.getVy,
            msg.getVz),
          Attitude(
            msg.getRoll,
            msg.getPitch,
            msg.getYaw),
          Wind(
            msg.getWindSouth,
            msg.getWindWest),
          Engine(
            msg.getLeftRPM,
            msg.getRightRPM),
          Acceleration(
            msg.getAccelX,
            msg.getAccelY,
            msg.getAccelZ),
          msg.getCompass,
          msg.getAgl,
          Tracker(status,orbiting,from,to,eta)
        )
          daoService.createTelemetrySample(sample)
        }
      }
    })

    val statusSub: Subscriber[AutopilotStatus] = connectedNode.newSubscriber("autopilot_status", AutopilotStatus._TYPE)
    statusSub.addMessageListener(new MessageListener[AutopilotStatus]{
      override def onNewMessage(msg: AutopilotStatus): Unit = {
        log.info("[VehicleNode]: received new status message from vehicle " +  msg.getHeader.getVehicleId)
        status = (msg.getTrackerStatus == 1) 
        orbiting = msg.getOrbiting
        from = msg.getWpFrom
        to = msg.getWpTo
        eta = msg.getTimeToWp
        gotStatus = true
      }
    })
    val waypointSub: Subscriber[AutopilotWaypoint] = connectedNode.newSubscriber("autopilot_waypoint_from_ap", AutopilotWaypoint._TYPE)
    waypointSub.addMessageListener(new MessageListener[AutopilotWaypoint] {
      override def onNewMessage(msg: AutopilotWaypoint): Unit = {
        log.info("[VehicleNode]: received new waypoint message from vehicle " +  msg.getHeader.getVehicleId)        
        val sample = WaypointSample(
          None,
          time,
          msg.getIndex,
          msg.getHeader.getVehicleId,
          Location(msg.getLatitude,msg.getLongitude,msg.getAltitude),
          Orbit(msg.getOrbitDirection,msg.getOrbitRadius,msg.getOrbitTime),
          msg.getNext)
        daoService.createWaypointSample(sample)
      }
    })

    val waypointRequestPub: Publisher[AutopilotRequestWaypoints] = connectedNode.newPublisher("autopilot_request_waypoints",AutopilotRequestWaypoints._TYPE)
    connectedNode.executeCancellableLoop(
      new CancellableLoop{
        override def loop: Unit = {
          if (vehicleId != 0){
            Thread.sleep(1000)
            var req: AutopilotRequestWaypoints = waypointRequestPub.newMessage
            var header = req.getHeader
            header.setVehicleId(vehicleId)
            req.setHeader(header)
            waypointRequestPub.publish(req)
          }
        }
      }
    )

    super.onStart(connectedNode)
  }
}
