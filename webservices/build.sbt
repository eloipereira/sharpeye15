name := "ciafaWebServices"

version := "0.0.0-SNAPSHOT"

scalaVersion := "2.10.3"

libraryDependencies ++= Seq(
  "io.spray" % "spray-can" % "1.1-M8",
  "io.spray" % "spray-http" % "1.1-M8",
  "io.spray" % "spray-routing" % "1.1-M8",
  "com.typesafe.akka" %% "akka-actor" % "2.1.4",
  "com.typesafe.akka" %% "akka-slf4j" % "2.1.4",
  "com.typesafe.slick" %% "slick" % "2.0.0",
  "mysql" % "mysql-connector-java" % "5.1.25",
  "net.liftweb" %% "lift-json" % "2.5.1",
  "ch.qos.logback" % "logback-classic" % "1.0.13",
  "pt.edu.academiafa" % "seagull-rosjava-lib" % "0.0.2",
  "pt.edu.academiafa.seagull" % "seagull_autopilot_msgs" % "0.0.4",
  "pt.edu.academiafa.seagull" % "seagull_commons_msgs" % "0.0.2"
)

resolvers ++= Seq(
  "Spray repository" at "http://repo.spray.io",
  "Typesafe repository" at "https://repo.typesafe.com/typesafe/releases/",
  "Seagull RosJava" at "https://bitbucket.org/ciafa-sw/maven2-release/raw/master/seagull-rosjava-libs",
  "Seagull Messages" at "https://bitbucket.org/ciafa-sw/maven2-release/raw/master/ros-messages"
)
