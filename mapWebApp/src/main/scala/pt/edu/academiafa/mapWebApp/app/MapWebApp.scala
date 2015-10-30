package pt.edu.academiafa.mapWebApp.app

import scala.scalajs.js.annotation.JSExport

import scala.scalajs.js
import js.Dynamic.{ global => g, newInstance => jsnew, literal => lit }
import org.scalajs.dom
import dom.document
import org.scalajs.dom.XMLHttpRequest
import scala.scalajs.js.JSON
import scala.scalajs.js.Date
import pt.edu.academiafa.mapWebApp.config.Configuration
import org.scalajs.dom._
import scala.math.round


@JSExport
object MissionViewer extends js.JSApp {

  @JSExport
  def main(): Unit = {
    println("---------Mission Information System---------------")  
    
    val xmlHttpRequest = new dom.XMLHttpRequest
    var mayUpdate = true


    def droneSymb(rotation: Int) = {
      val symbPath = "m -1.5518868,22.364637 -18.7999992,-0.452 v -2.381 l 18.5189992,-4.206 c 0,0 -0.617,-10.8989994 -0.617,-12.2769994 0,-0.112 -0.596,2.47 -0.596,2.47 l -46.7139992,-3.704 v -4.14 l 47.2369992,-3.122 c 0,-14.5590006 -1.815,-15.8760006 -1.815,-21.4080006 0,-2.835 2.687,-7.845 4.578,-7.845 1.8920001,0 4.5780004,5.01 4.5780004,7.845 0,5.532 -1.815,6.85 -1.815,21.4080006 l 47.2370004,3.123 v 4.14 l -46.7140004,3.703 c 0,0 -0.596,-2.582 -0.596,-2.47 0,1.378 -0.617,12.2769994 -0.617,12.2769994 l 18.5200004,4.206 v 2.381 l -18.8000007,0.452 -0.318,-2.021 c 0,0 -0.157,2.593 -0.5540001,4.472 1.3650004,-0.087 3.0680004,-0.194 3.2500004,-0.207 0.45,-0.032 0.85,0.21 0.893,0.541 0.044,0.33 -0.305,0.744 -1.107,0.61 -1.795,-0.302 -3.1260004,-0.521 -4.0920004,-0.665 -0.663,-0.1 -0.871,-0.71 -0.899,-0.871 -0.313,-1.787 -0.44,-3.88 -0.44,-3.88 l -0.318,2.021 z m 1.64,3.398 c -0.974,-0.114 -2.26,-0.321 -3.958,-0.651 -0.799,-0.154 -1.151,0.28 -1.108,0.61 0.043,0.331 0.443,0.573 0.893,0.541 0.2,-0.014 2.228,-0.143 3.634,-0.231 0.19,0.603 0.418,1.005 0.691,1.005 0.207,0 0.388,-0.23 0.546,-0.603 0.035,-0.111 0.259,-0.56 -0.698,-0.671 z"
      val symbScale = 0.6
      val symbColor = "black"
      val symbFillOpacity = 0.7
      val symbStrokeWeight = 1
      lit(path = symbPath, scale = symbScale, rotation = rotation, fillColor = symbColor, fillOpacity = symbFillOpacity, strokeWeight = symbStrokeWeight)
    }



    def batSymb(rotation: Int) = {
      val symbPath = "m 0.77413318,-3.7056683 c 0,0.481 -0.443,0.812 -0.807,0.812 -0.338,0 -0.809,-0.33 -0.809,-0.812 l 0,0 c 0,0 0.051,1.766 -0.64599998,2.123 -1.037,0.531 -2.484,-0.09 -2.484,-0.936 0,-0.846 1.1,-1.186 1.1,-1.186 0,0 -1.4,-0.215 -3.873,0.795 -3.184,1.299 -4.1410002,3.40600003 -4.1410002,3.40600003 0,0 0.693,-0.707 2.0330002,-0.707 1.336,0 2.836,1.049 2.836,2.40999997 0,0 0.836,-0.592 1.982,-0.592 2.373,0 4.00199998,2.484 4.00199998,3.418 0,-0.934 1.62700002,-3.418 3.99800002,-3.418 1.148,0 1.982,0.592 1.982,0.592 0,-1.36099997 1.5,-2.40999997 2.838,-2.40999997 1.3379998,0 2.0309998,0.707 2.0309998,0.707 0,0 -0.9549998,-2.10700003 -4.1389998,-3.40600003 -2.472,-1.009 -3.872,-0.794 -3.872,-0.794 0,0 1.098,0.34 1.098,1.186 0,0.846 -1.549,1.504 -2.6,0.871 -0.66800002,-0.403 -0.52900002,-2.057 -0.52900002,-2.057 v -0.002 z"
      val symbScale = 3
      val symbColor = "black"
      val symbFillOpacity = 0.7
      val symbStrokeWeight = 1
      lit(path = symbPath, scale = symbScale, rotation = rotation, fillColor = symbColor, fillOpacity = symbFillOpacity, strokeWeight = symbStrokeWeight)
    }

    def initialize() = js.Function{
      var telemetry = callTelemetryService
      var destWaypoint = callWaypointService(telemetry.track.to.toString.toInt)
      val map_canvas = document.getElementById("map_canvas")
      val map_options = lit(center = (jsnew(g.google.maps.LatLng))(telemetry.loc.lat, telemetry.loc.lon), zoom = 14, mapTypeId = g.google.maps.MapTypeId.ROADMAP)
      val googleMap = (jsnew(g.google.maps.Map))(map_canvas, map_options) 
      val marker = (jsnew(g.google.maps.Marker))(lit(map = googleMap, icon = droneSymb(round(telemetry.att.yaw.toString.toFloat)),  position = (jsnew(g.google.maps.LatLng)(telemetry.loc.lat, telemetry.loc.lon))))
      val markerDest = (jsnew(g.google.maps.Marker))(lit(map = googleMap, position = (jsnew(g.google.maps.LatLng)(destWaypoint.loc.lat, destWaypoint.loc.lon))))

      var footprintCoords =  Array(
        (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice0.lat, telemetry.footprint.vertice0.lon),
        (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice1.lat, telemetry.footprint.vertice1.lon),
        (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice2.lat, telemetry.footprint.vertice2.lon),
        (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice3.lat, telemetry.footprint.vertice3.lon)
      )

      val footprint = (jsnew(g.google.maps.Polygon)(lit(
        map = googleMap,
        paths = footprintCoords,
        strokeColor = "#FA0000",
        strokeOpacity = 0.1,
        strokeWeight = 2,
        fillColor = "#FF0000",
        fillOpacity = 0.35)
      ))   
      
      val lineSymbol = lit(path = "M 0,-1 0,1", strokeOpacity = 0.8, scale = 2)
      var linePath = js.Array(
        (jsnew(g.google.maps.LatLng))(destWaypoint.loc.lat, destWaypoint.loc.lon),
        (jsnew(g.google.maps.LatLng))(telemetry.loc.lat, telemetry.loc.lon))
      val lineIcons = js.Array(lit(repeat = "20px", icon = lineSymbol ,offset = "100%"))
      val polylineoptns = lit(strokeOpacity = 0,map = googleMap, path = linePath, icons = lineIcons)    
      val destLine = (jsnew(g.google.maps.Polyline)(polylineoptns))


      val MAX_TRAJECTORY_SIZE = 200
      val initTrajectory = callTrajectoryService(telemetry.vId.toString.toInt,MAX_TRAJECTORY_SIZE)
      val trajectoryLineSymbol = lit(path = "M 0,-1 0,1", strokeOpacity = 0.2, scale = 2)
      
     
      var flightTrajectory = initTrajectory.map{l: js.Dynamic => 
        (jsnew(g.google.maps.LatLng))(l.lat, l.lon)
      }

      val trajectoryPolylineoptns = lit(strokeOpacity = 0.8, strokeColor= "blue",  map = googleMap, path = flightTrajectory)
      val trajectLine = (jsnew(g.google.maps.Polyline)(trajectoryPolylineoptns))

      updateTelemetryData
      updateDestinationData

      dom.setInterval(()=>{
        if (mayUpdate){
          telemetry = callTelemetryService
          updateTelemetryData
        }
      }
      ,3000)
      
      dom.setInterval(()=>{
        if (mayUpdate){
          destWaypoint = callWaypointService(telemetry.track.to.toString.toInt)
          updateDestinationData
        }
      }
      ,10000)

      def updateTelemetryData={
        document.getElementById("vId").innerHTML = "" + telemetry.vId.toString
        document.getElementById("ias").innerHTML = (telemetry.ias.toString.toFloat/1.943844).toString
        document.getElementById("alt").innerHTML = (telemetry.loc.alt.toString.toFloat/3.28084).toString
        document.getElementById("roll").innerHTML = telemetry.att.roll.toString
        document.getElementById("pitch").innerHTML = telemetry.att.pitch.toString
        document.getElementById("yaw").innerHTML = telemetry.att.yaw.toString
        document.getElementById("loc").innerHTML = "[" + telemetry.loc.lat.toString + ", " + telemetry.loc.lon.toString + "]"
        val eta = telemetry.track.eta.toString.toInt
        document.getElementById("eta").innerHTML = if (eta == 32767) {0.toString} else {round(eta/60).toString}
        document.getElementById("elapsedTime").innerHTML = telemetry.elapsedTime.toString // round(telemetry.elapsedTime.toString.toInt/6).toString
        document.getElementById("timestamp").innerHTML = msToTime(telemetry.timestamp.toString.toLong)
        footprintCoords =  Array(
          (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice0.lat, telemetry.footprint.vertice0.lon),
          (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice1.lat, telemetry.footprint.vertice1.lon),
          (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice2.lat, telemetry.footprint.vertice2.lon),
          (jsnew(g.google.maps.LatLng))(telemetry.footprint.vertice3.lat, telemetry.footprint.vertice3.lon)
        )
	marker.setPosition( (jsnew(g.google.maps.LatLng)(telemetry.loc.lat, telemetry.loc.lon)))
        marker.setIcon(droneSymb(round(telemetry.att.yaw.toString.toFloat)))
        footprint.setPaths(footprintCoords)
        linePath = Array(
          (jsnew(g.google.maps.LatLng))(destWaypoint.loc.lat, destWaypoint.loc.lon),
          (jsnew(g.google.maps.LatLng))(telemetry.loc.lat, telemetry.loc.lon))
        destLine.setPath(linePath)
        flightTrajectory.push((jsnew(g.google.maps.LatLng))(telemetry.loc.lat, telemetry.loc.lon))
        if(flightTrajectory.length > MAX_TRAJECTORY_SIZE){
          flightTrajectory.shift
        }
        trajectLine.setPath(flightTrajectory)
    }

    def updateDestinationData={
      document.getElementById("dest").innerHTML = "[" + destWaypoint.loc.lat.toString + ", " + destWaypoint.loc.lon.toString + "]"
      markerDest.setPosition((jsnew(g.google.maps.LatLng)(destWaypoint.loc.lat, destWaypoint.loc.lon)))
      linePath = Array(
        (jsnew(g.google.maps.LatLng))(destWaypoint.loc.lat, destWaypoint.loc.lon),
        (jsnew(g.google.maps.LatLng))(telemetry.loc.lat, telemetry.loc.lon))
      destLine.setPath(linePath)
    }
      
      ""
  } 

    def msToTime(unix_timestamp: Long) = {
      val date = new Date(unix_timestamp );
      val hrs = date.getHours();
      val mins = date.getMinutes();
      val secs = date.getSeconds();
      hrs + ":" + mins + ":" + secs
    }

    def callTelemetryService(): js.Dynamic = {
      
      xmlHttpRequest.open("GET", "http://62.28.239.27:8080/telemetry/" , false)
      xmlHttpRequest.send();
      JSON.parse(xmlHttpRequest.responseText)
    }

    def callWaypointService(index: Int): js.Dynamic = {
      xmlHttpRequest.open("GET", "http://62.28.239.27:8080/waypoint?index=%s".format(index) , false)
      xmlHttpRequest.send();
      JSON.parse(xmlHttpRequest.responseText)
    }
   
    def callTrajectoryService(vId: Int,size: Int): js.Dynamic = {
      xmlHttpRequest.open("GET", "http://62.28.239.27:8080/trajectory?vId=%s&length=%s".format(vId,size) , false)
      xmlHttpRequest.send();
      JSON.parse(xmlHttpRequest.responseText)
    }
   
      (jsnew(g.google.maps.event.addDomListener)(window, "load", initialize))
  }
}
