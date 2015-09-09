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

@JSExport
object MissionViewer extends js.JSApp {

  @JSExport
  def main(): Unit = {
    println("---------Mission Information System---------------")

    def initialize() = js.Function{
      val result = callTelemetryService
      val map_canvas = document.getElementById("map_canvas")
      val map_options = lit(center = (jsnew(g.google.maps.LatLng))(result.loc.lat, result.loc.lon), zoom = 3, mapTypeId = g.google.maps.MapTypeId.ROADMAP)
      val gogleMap = (jsnew(g.google.maps.Map))(map_canvas, map_options)
      val marker = (jsnew(g.google.maps.Marker))(lit(map = gogleMap, position = (jsnew(g.google.maps.LatLng)(result.loc.lat, result.loc.lon))))

      updateTable(result.vId.toString,result.ias.toString,result.loc.lat.toString,result.loc.lon.toString,result.loc.lon.toString,result.timestamp.toString)

      dom.setInterval(()=>{
        val result = callTelemetryService
        updateTable(result.vId.toString,result.ias.toString,result.loc.lat.toString,result.loc.lon.toString,result.loc.lon.toString,result.timestamp.toString)
        marker.setPosition( (jsnew(g.google.maps.LatLng)(result.loc.lat, result.loc.lon)))
      }
      ,10000)
      
      
      ""
  } 

    def msToTime(unix_timestamp: Long) = {
      val date = new Date(unix_timestamp * 1000);
      val hrs = date.getHours();
      val mins = date.getMinutes();
      val secs = date.getSeconds();
      hrs + ":" + mins + ":" + secs
    }

  

    def updateTable(vId: String, ias: String, lat: String, lon: String, alt: String, timestamp: String)={
      document.getElementById("vId").innerHTML = "" + vId 
      document.getElementById("ias").innerHTML = ias + " m/s"
      document.getElementById("alt").innerHTML = alt + " m"
      document.getElementById("loc").innerHTML = "[" + lat + ", " + lon + "]"
      document.getElementById("timestamp").innerHTML = msToTime(timestamp.toString.toLong)
    }

    def callTelemetryService() = {
      val xmlHttpRequest = new dom.XMLHttpRequest
      xmlHttpRequest.open("GET", "http://62.28.239.27:8080/telemetry/" , false)
      xmlHttpRequest.send();
      JSON.parse(xmlHttpRequest.responseText)
    }
   
      (jsnew(g.google.maps.event.addDomListener)(window, "load", initialize))
  // dom.setInterval(()=> initialize, 10000)
  }
}
