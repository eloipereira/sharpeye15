// Turn this project into a Scala.js project by importing these settings
scalaJSSettings

name := "Mission-Viewer-Scala.js"

version := "0.1"

scalaVersion := "2.11.2"

libraryDependencies ++= Seq(
  "org.scala-lang.modules.scalajs" %%% "scalajs-dom" % "0.6",
  "com.typesafe.akka" %% "akka-slf4j" % "2.3.13"
)


resolvers ++= Seq("Typesafe repository" at "https://repo.typesafe.com/typesafe/releases/")
