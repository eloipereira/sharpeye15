package pt.edu.academiafa.ciafaWebServices.config

import com.typesafe.config.ConfigFactory
import java.net.{URI, URISyntaxException}
import util.Try
import org.ros.address.InetAddressFactory
import org.ros.node.NodeConfiguration

trait Configuration{
  /**
   * Application config object.
   */
  val config = ConfigFactory.load()

  lazy val missionName = Try(config.getString("mission.name")).getOrElse("test")

  /** Host name/address to start service on. */
  lazy val serviceHost = Try(config.getString("service.host")).getOrElse("localhost")

  /** Port to start service on. */
  lazy val servicePort = Try(config.getInt("service.port")).getOrElse(8080)

  /** Database host name/address. */
  lazy val dbHost = Try(config.getString("db.host")).getOrElse("localhost")

  /** Database host port number. */
  lazy val dbPort = Try(config.getInt("db.port")).getOrElse(3306)

  /** Service database name. */
  lazy val dbName = Try(config.getString("db.name")).getOrElse("rest")

  /** User name used to access database. */
  lazy val dbUser = Try(config.getString("db.user")).toOption.orNull

  /** Password for specified user and database. */
  lazy val dbPassword = Try(config.getString("db.password")).toOption.orNull

  /** ROS Configuration */
  lazy val rosConfiguration: NodeConfiguration = NodeConfiguration.newPublic(InetAddressFactory.newNonLoopback.getHostName, masterUri)
  
  lazy val rosmasterHost: String = Try(config.getString("ros.host")).getOrElse("localhost")

  lazy val rosmasterPort: Int = Try(Integer.parseInt(config.getString("ros.port"))).getOrElse(11311)

   lazy val samplePeriod: Int = Try(Integer.parseInt(config.getString("ros.samplePeriod"))).getOrElse(0)
  
  lazy val updateWaypointsPeriod: Int = Try(Integer.parseInt(config.getString("piccolo.updateWP"))).getOrElse(60000)

  lazy val fuelSensorSource: Int = Try(Integer.parseInt(config.getString("piccolo.fuelSource"))).getOrElse(1)

  lazy val masterUri: URI = Try(new URI("http", null, rosmasterHost, rosmasterPort, "/", null, null)).getOrElse(new URI("http://localhost:11311/"))

  /** Platform configuration */

  lazy val sensorOffsetX: Float = Try(config.getString("sensor.offset.x").toFloat).getOrElse(0.0f)

  lazy val sensorOffsetY: Float = Try(config.getString("sensor.offset.y").toFloat).getOrElse(0.0f)

  lazy val sensorOffsetZ: Float = Try(config.getString("sensor.offset.z").toFloat).getOrElse(0.0f)

  lazy val sensorPan: Float = Try(config.getString("sensor.Attitude.pan").toFloat).getOrElse(0.0f)

  lazy val sensorTilt: Float = Try(config.getString("sensor.Attitude.tilt").toFloat).getOrElse(-90.0f)

  lazy val sensorWidth: Int = Try(Integer.parseInt(config.getString("sensor.width"))).getOrElse(640)

  lazy val sensorHeight: Int = Try(Integer.parseInt(config.getString("sensor.height"))).getOrElse(480)

  lazy val sensorFocal: Int = Try(Integer.parseInt(config.getString("sensor.focal"))).getOrElse(500)
}

object Configuration extends Configuration
