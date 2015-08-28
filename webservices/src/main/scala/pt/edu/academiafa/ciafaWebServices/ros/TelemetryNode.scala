package pt.edu.academiafa.ciafaWebServices.ros

import org.ros.message.MessageListener
import org.ros.namespace.GraphName
import org.ros.node.AbstractNodeMain
import org.ros.node.ConnectedNode
import org.ros.node.NodeMain
import org.ros.node.topic.Subscriber
import org.apache.commons.logging.Log

import seagull_autopilot_msgs.AutopilotADCSamples
import seagull_autopilot_msgs.AutopilotTelemetry

import pt.edu.academiafa.ciafaWebServices.domain.TelemetrySample
import pt.edu.academiafa.ciafaWebServices.dao._

class TelemetryNode extends AbstractNodeMain{

  val daoService = new TelemetrySampleDAO
  override def getDefaultNodeName: GraphName = GraphName.of("telemetry/listener")
  override def onStart(connectedNode: ConnectedNode): Unit = {
    val log: Log = connectedNode.getLog
    val subscriber: Subscriber[AutopilotTelemetry] = connectedNode.newSubscriber("autopilot_telemetry", AutopilotTelemetry._TYPE)
    subscriber.addMessageListener(new MessageListener[AutopilotTelemetry] {
      override def onNewMessage(msg: AutopilotTelemetry): Unit = {
        log.info("[TelemetryNode]: received new telemetry message")
        val sample = TelemetrySample(
          None,
          msg.getTimestamp,
          0, //FIXME - get vehicle ID from header
          msg.getLatitude,
          msg.getLongitude,
          msg.getAltitude,
          msg.getIas,
          msg.getVx,
          msg.getVy,
          msg.getVz,
          msg.getRoll,
          msg.getPitch,
          msg.getYaw,
          msg.getWindSouth,
          msg.getWindWest,
          msg.getLeftRPM,
          msg.getRightRPM,
          msg.getAccelX,
          msg.getAccelY,
          msg.getAccelZ,
          msg.getCompass,
          msg.getAgl
        )
        daoService.create(sample)
      }
    })
 

    super.onStart(connectedNode)
  }
}
