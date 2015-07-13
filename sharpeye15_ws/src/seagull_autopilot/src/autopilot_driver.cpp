// ==========================================================================
// Copyright (C) 2013 Portuguese Air Force Academy                       =
// Research Center                                                          =
// Granja do Marques, Academia, Pero-Pinheiro                               =
// ==========================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
// ==========================================================================
// Project: seagull_autopilot@seagull_autopilot
// Date:    Jan 17, 2014
// Author:  posilva
// -------------------------------------------------------------------------=
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Description: autopilot_driver.cpp
//
// ==========================================================================
#include <ros/ros.h>
#include <seagull_autopilot/AutopilotDriver.h>
#include <exception>

/**!
 *
 */
int main(int argc, char **argv) {
	try {
		ros::init(argc, argv, "autopilot_driver");
		AutopilotDriver autopilot;
		autopilot.setup();

		ros::Rate loop_rate(100);
		while (ros::ok()) {
			autopilot.loop();
			ros::spinOnce();
			loop_rate.sleep();
		}
	} catch (std::exception &e) {
		printf ("***%s\n",e.what());
		return -1;
	}

	return 0;
}
