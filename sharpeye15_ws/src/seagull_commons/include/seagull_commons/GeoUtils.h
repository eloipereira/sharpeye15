// ==========================================================================
// = Copyright (C) 2013/2015 Seagull Project - Contrato Ref: 20131034063    =
// = -----------------------------------------------------------------------=
// = Parceiros:
// =  - Critical Software - CSW
// =  - Força Aérea Portuguesa - FAP
// =  - Marinha Portuguse - MP 
// =  - Instituto Superior Técnico - IST/ISR
// =  - Faculdade de Eng. do Porto - FEUP
// ==========================================================================
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Project: seagull_navigation-Debug@seagull_navigation
// Date:    May 17, 2014
// Author: Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: GeoUtils.h
//
// ==========================================================================

#ifndef GEOUTILS_H_
#define GEOUTILS_H_
#include <iostream>
#include <cmath>
#include <stdio.h>
#define POW_2(x) ((x)*(x))
#define POW_3(x) (POW_2((x))+(x))
/**
 * Constants definition
 * This code was tested with Matlab 2013a lnx64
 */

const double EARTH_SEMIMAJOR_AXIS_WGS_84 = 6378137.0;
const double EARTH_FLATTENING = 1.0 / 298.257223563;
const double EARTH_ECCENTRICITY_SQUARE = 2.0 * EARTH_FLATTENING - EARTH_FLATTENING * EARTH_FLATTENING;
const double EARTH_ECCENTRICITY_SQUARE_SECOND = EARTH_FLATTENING * (2.0 - EARTH_FLATTENING)
    / (POW_2((1 - EARTH_FLATTENING)));
const double EARTH_SEMIMINOR_AXIS_WGS_84 = EARTH_SEMIMAJOR_AXIS_WGS_84 * (1.0 - EARTH_FLATTENING);

class GeoUtils
{
public:

  typedef struct
  {
    double e;
    double n;
    double u;
  } ENU;
  typedef struct
  {
    double lat;
    double lng;
    double h;
  } LLH;
  typedef struct
  {
    double x;
    double y;
    double z;
  } ECEF;

  enum AngleUnits
  {
    Degrees, Radians, AngleUnitsSize
  };

  static const double DEG_TO_RAD = 0.017453292519943295769236907684886;
  /// @brief Earth's quatratic mean radius for WGS-84
  static const double EARTH_RADIUS_IN_METERS = 6372797.560856;

  /** @brief Computes the arc, in radian, between two WGS-84 positions.
   *
   * The result is equal to <code>Distance(from,to)/EARTH_RADIUS_IN_METERS</code>
   *    <code>= 2*asin(sqrt(h(d/EARTH_RADIUS_IN_METERS )))</code>
   *
   * where:<ul>
   *    <li>d is the distance in meters between 'from' and 'to' positions.</li>
   *    <li>h is the haversine function: <code>h(x)=sin²(x/2)</code></li>
   * </ul>
   *
   * The haversine formula gives:
   *    <code>h(d/R) = h(lat0-lat0)+h(from.lon-to.lon)+cos(lat0)*cos(lat0)</code>
   *
   * @sa http://en.wikipedia.org/wiki/Law_of_haversines
   */
  static double ArcInRadians(const double& lat0, const double& lng0, const double& lat1, const double& lng1)
  {
    double latitudeArc = (lat1 - lat0) * DEG_TO_RAD;
    double longitudeArc = (lng1 - lng0) * DEG_TO_RAD;
    double latitudeH = sin(latitudeArc * 0.5);
    latitudeH *= latitudeH;
    double lontitudeH = sin(longitudeArc * 0.5);
    lontitudeH *= lontitudeH;
    double tmp = cos(lat1 * DEG_TO_RAD) * cos(lat0 * DEG_TO_RAD);
    return 2.0 * asin(sqrt(latitudeH + tmp * lontitudeH));
  }

  /** @brief Computes the distance, in meters, between two WGS-84 positions.
   *
   * The result is equal to <code>EARTH_RADIUS_IN_METERS*ArcInRadians(from,to)</code>
   *
   * @sa ArcInRadians
   */
  static double DistanceInMeters(const double& lat0, const double& lng0, const double& lat1, const double& lng1)
  {
    return EARTH_RADIUS_IN_METERS * ArcInRadians(lat0, lng0, lat1, lng1);
  }
  /**
   *
   * Source : http://wiki.gis.com/wiki/index.php/Geodetic_system#From_local_ENU_coordinates_to_geodetic_coordinates
   *--------------------------------------------
   * @param x
   * @param y
   * @param z
   * @param units
   * @return
   */
  static LLH ecef2geodetic(const double &x, const double &y, const double &z, const AngleUnits units = Degrees)
  {
    LLH result;

    double a = EARTH_SEMIMAJOR_AXIS_WGS_84;
    double b = EARTH_SEMIMINOR_AXIS_WGS_84;
    double e2 = EARTH_ECCENTRICITY_SQUARE;
    double ep2 = EARTH_ECCENTRICITY_SQUARE_SECOND;
    double f = EARTH_FLATTENING;

    double r2 = pow(x, 2.0) + pow(y, 2.0);
    double E2 = pow(a, 2.0) - pow(b, 2.0);
    double F = 54.0 * pow(b, 2.0) * pow(z, 2.0);

    double r = sqrt(r2);
    double G = r2 + (1.0 - e2) * pow(z, 2.0) - e2 * E2;
    double c = (pow(e2, 2.0) * F * r2) / (pow(G, 3.0));
    double s = pow((1.0 + c + sqrt(pow(c, 2.0) + 2.0 * c)), (1.0 / 3.0));
    double P = F / (3.0 * pow((s + 1.0 / s + 1.0), 2.0) * pow(G, 2.0));
    double Q = sqrt(1.0 + 2 * pow(e2, 2.0) * P);
    double ro = -(e2 * P * r) / (1.0 + Q)
        + sqrt((pow(a, 2.0) / 2.0) * (1 + 1.0 / Q) - ((1.0 - e2) * P * pow(z, 2.0)) / (Q * (1.0 + Q)) - P * r2 / 2.0);

    double tmp = pow((r - e2 * ro), 2.0);
    double U = sqrt(tmp + pow(z, 2.0));
    double V = sqrt(tmp + (1.0 - e2) * pow(z, 2.0));
    double zo = (b * b * z) / (a * V);

    result.h = U * (1 - pow(b, 2.0) / (a * V));
    result.lat = atan((z + ep2 * zo) / r);
    result.lng = atan2(y, x);

    if (units == Degrees)
    {
      result.lat = rad2deg(result.lat);
      result.lng = rad2deg(result.lng);
    }

    return result;
  }

  /**
   *
   * @param phi - latitude
   * @param lambda - longitude
   * @param h - altitude abouve earth in meters
   * @param units Input given in Degrees(default) or Radians
   * @return
   */
  static ECEF geodetic2ecef(const double& phi, const double& lambda, const double& h, const AngleUnits units = Degrees)
  {
    double lat = phi;
    double lon = lambda;
    if (units == Degrees)
    {
      lat = deg2Rad(lat);
      lon = deg2Rad(lon);
    }
    double cos_lat = std::cos(lat);
    double sin_lat = std::sin(lat);
    double cos_lon = std::cos(lon);
    double sin_lon = std::sin(lon);
    double rn = computeRn(lat);
    ECEF ecef;
    ecef.x = (rn + h) * cos_lat * cos_lon;
    ecef.y = (rn + h) * cos_lat * sin_lon;
    ecef.z = (((1.0 - EARTH_ECCENTRICITY_SQUARE) * rn) + h) * sin_lat;
    return ecef;
  }
  /**

   *
   * @param e
   * @param n
   * @param u
   * @param lat0
   * @param lng0
   * @param h0
   * @param units
   * @return
   */
  static ECEF enu2ecef(const double &e, const double &n, const double &u, const double &lat0, const double &lng0,
                       const double &h0, const AngleUnits units = Degrees)
  {
    ECEF result;
    double lat = lat0;
    double lng = lng0;

    if (units == Degrees)
    {
      lat = deg2Rad(lat);
      lng = deg2Rad(lng);
    }

    ECEF ref = geodetic2ecef(lat0, lng0, h0, units);
    result.x = -sin(lng) * e - cos(lng) * sin(lat) * n + cos(lng) * cos(lat) * u + ref.x;
    result.y = cos(lng) * e - sin(lng) * sin(lat) * n + cos(lat) * sin(lng) * u + ref.y;
    result.z = cos(lat) * n + sin(lat) * u + ref.z;
    return result;
  }
  /**
   *
   * @param x
   * @param y
   * @param z
   * @param lat0
   * @param lng0
   * @param h0
   * @param units
   * @return
   */
  static ENU ecef2enu(const double &x, const double &y, const double &z, const double &lat0, const double &lng0,
                      const double &h0, const AngleUnits units = Degrees)
  {
    ENU result;
    double rlat0 = lat0;
    double rlng0 = lng0;
    if (units == Degrees)
    {
      rlat0 = deg2Rad(rlat0);
      rlng0 = deg2Rad(rlng0);
    }
    ECEF ref = geodetic2ecef(lat0, lng0, h0, units); //validated by enu2ecef call

    double lat = rlat0;
    double lng = rlng0;
    result.e = -sin(lng) * (x - ref.x) + cos(lng) * (y - ref.y);
    result.n = -sin(lat) * cos(lng) * (x - ref.x) - sin(lat) * sin(lng) * (y - ref.y) + cos(lat) * (z - ref.z);
    result.u = cos(lat) * cos(lng) * (x - ref.x) + cos(lat) * sin(lng) * (y - ref.y) + sin(lat) * (z - ref.z);

    return result;
  }
  /**
   *
   * @param e
   * @param n
   * @param u
   * @param lat0
   * @param lng0
   * @param h0
   * @param units
   * @return
   */
  static LLH enu2geodetic(const double &e, const double &n, const double &u, const double &lat0, const double &lng0,
                          const double &h0, const AngleUnits units = Degrees)
  {

    ECEF ecef = enu2ecef(e, n, u, lat0, lng0, h0, units);
    return ecef2geodetic(ecef.x, ecef.y, ecef.z, units);

  }

  /**
   *
   * @param lat
   * @param lng
   * @param h
   * @param lat0
   * @param lng0
   * @param h0
   * @param units
   * @return
   */
  static ENU geodetic2enu(const double &lat, const double &lng, const double &h, const double &lat0, const double &lng0,
                          const double &h0, const AngleUnits units = Degrees)
  {
    ECEF point = GeoUtils::geodetic2ecef(lat, lng, h, units);
    return GeoUtils::ecef2enu(point.x, point.y, point.z, lat0, lng0, h0, units);
  }

  /**
   *
   * @param lat
   * @return
   */
  static inline double computeRn(double lat)
  {
    double lat_sin = std::sin(lat);
    return EARTH_SEMIMAJOR_AXIS_WGS_84 / std::sqrt(1 - EARTH_ECCENTRICITY_SQUARE * (lat_sin * lat_sin));
  }

  static inline void print(LLH p)
  {
    std::cout << p.lat << "," << p.lng << "," << p.h << std::endl;
  }
  static inline void print(const char * m, LLH p)
  {
    std::cout << m << ":" << p.lat << "," << p.lng << "," << p.h << std::endl;
  }

  static inline void print(ENU p)
  {
    std::cout << p.e << "," << p.n << "," << p.u << std::endl;
  }
  static inline void print(const char * m, ENU p)
  {
    std::cout << m << ":" << p.e << "," << p.n << "," << p.u << std::endl;
  }

  static inline void print(const char * m, ECEF p)
  {
    std::cout << m << ":" << p.x << "," << p.y << "," << p.z << std::endl;
  }

  static inline void print(ECEF p)
  {
    std::cout << p.x << "," << p.y << "," << p.z << std::endl;
  }
  static inline double rad2deg(double rad)
  {
    return (rad * 180) / M_PI;
  }
  static inline double deg2Rad(double deg)
  {
    return (deg * M_PI) / 180;
  }

private:
  GeoUtils(GeoUtils&)
  {
  }
  ;
  GeoUtils()
  {
  }
  ;
  virtual ~GeoUtils()
  {
  }
  ;
};
#endif /* GEOUTILS_H_ */
