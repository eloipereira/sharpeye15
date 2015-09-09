package pt.edu.academiafa.mapWebApp.config

import com.typesafe.config.ConfigFactory
import java.net.{URI, URISyntaxException}
import util.Try

trait Configuration{
  /**
   * Application config object.
   */
  val config = ConfigFactory.load()

  /** Webservices configuration */

  lazy val uavServiceHost = Try(config.getString("webservices.uav.host")).getOrElse("localhost")
  lazy val uavServicePort = Try(config.getInt("webservices.uav.port")).getOrElse(8080)
}
