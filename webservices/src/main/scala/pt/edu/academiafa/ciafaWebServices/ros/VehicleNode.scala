package pt.edu.academiafa.ciafaWebServices.ros


import org.ros.message.MessageListener
import org.ros.namespace.GraphName
import org.ros.node.AbstractNodeMain
import org.ros.node.ConnectedNode
import org.ros.node.NodeMain
import org.ros.node.topic.Subscriber
import org.ros.node.topic.Publisher
import org.apache.commons.logging.Log
import scala.math.Pi

import seagull_autopilot_msgs.AutopilotADCSamples
import seagull_autopilot_msgs.AutopilotTelemetry
import seagull_autopilot_msgs.AutopilotWaypoint
import seagull_autopilot_msgs.AutopilotStatus
import seagull_autopilot_msgs.AutopilotRequestWaypoints
import org.ros.concurrent.CancellableLoop
import seagull_commons_msgs.SeagullHeader

import pt.edu.academiafa.ciafaWebServices.domain._
import pt.edu.academiafa.ciafaWebServices.dao._
import pt.edu.academiafa.ciafaWebServices.config.Configuration
import com.eloipereira.geoutils.Coordinate
import com.eloipereira.sensorutils.{SensorCoverage, Polygon,RollPitchYaw,PanTilt}
import collection.JavaConversions._

class VehicleNode extends AbstractNodeMain with Configuration{

  
  var time: Long = 0
  var vehicleId: Short = 0
  var status = false
  var orbiting = false
  var from:Short = 0
  var to:Short = 0 
  var eta = 0
  var gotStatus = false
  var fuel:Float = 0
  
  var lastSavedTime: Long = 0
  
  

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
          val poly:Polygon = SensorCoverage.getGeoSensorFootprint(
            new Coordinate(msg.getLatitude,msg.getLongitude,msg.getAltitude),
            new RollPitchYaw(msg.getRoll,msg.getPitch,msg.getYaw),
            new Coordinate(sensorOffsetX.toDouble,sensorOffsetY.toDouble,sensorOffsetZ.toDouble),
            new PanTilt(sensorPan,sensorTilt),
            sensorWidth,
            sensorHeight,
            sensorFocal
          )
          val vertices = poly.getPoints
          val v0lat = vertices(0).x.toFloat
          val v0lon = vertices(0).y.toFloat
          val v0alt = vertices(0).z.toFloat
          val v1lat = vertices(1).x.toFloat
          val v1lon = vertices(1).y.toFloat
          val v1alt = vertices(1).z.toFloat
          val v2lat = vertices(2).x.toFloat
          val v2lon = vertices(2).y.toFloat
          val v2alt = vertices(2).z.toFloat
          val v3lat = vertices(3).x.toFloat
          val v3lon = vertices(3).y.toFloat
          val v3alt = vertices(3).z.toFloat
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
            (msg.getCompass*180/Pi/10000).toFloat,
            msg.getAgl,
            Tracker(status,orbiting,from,to,eta),
            fuel,
            Trapezoid(
              Location(v0lat,v0lon,v0alt),
              Location(v1lat,v1lon,v1alt),
              Location(v2lat,v2lon,v2alt),
              Location(v3lat,v3lon,v3alt)
            )
          )

          if (time - lastSavedTime >= samplePeriod){
            daoService.createTelemetrySample(sample)
            lastSavedTime = time
          }
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

    val adcSamplesSub: Subscriber[AutopilotADCSamples] = connectedNode.newSubscriber("autopilot_adc_samples", AutopilotADCSamples._TYPE)
    adcSamplesSub.addMessageListener(new MessageListener[AutopilotADCSamples]{
      override def onNewMessage(msg: AutopilotADCSamples): Unit = {
        log.info("[VehicleNode]: received new adc samples message from vehicle " +  msg.getHeader.getVehicleId)
        fuelSensorSource match {
          case 1 => 
            fuel = msg.getAnalog1
          case 2 => 
            fuel = msg.getAnalog2
          case 3 => 
            fuel = msg.getAnalog3
          case 4 => 
            fuel = msg.getAnalog4
          case _ => 
            log.error("[VehicleNode]: Invalid fuel sensor source.")
        }
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
            Thread.sleep(updateWaypointsPeriod)
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
