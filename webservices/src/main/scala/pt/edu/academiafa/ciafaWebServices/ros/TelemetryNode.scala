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

class TelemetryNode extends AbstractNodeMain{

  override def getDefaultNodeName: GraphName = GraphName.of("telemetry/listener")
  override def onStart(connectedNode: ConnectedNode): Unit = {
    val log: Log = connectedNode.getLog
    val subscriber: Subscriber[AutopilotTelemetry] = connectedNode.newSubscriber("autopilot_telemetry", AutopilotTelemetry._TYPE)
    subscriber.addMessageListener(new MessageListener[AutopilotTelemetry] {
      override def onNewMessage(msg: AutopilotTelemetry): Unit = {
        log.info("[TelemetryNode]: received new telemetry message")
        //TODO - handle telemetry message and create new entry on db telemetry table
      }
    })
 

    super.onStart(connectedNode)
  }
}
