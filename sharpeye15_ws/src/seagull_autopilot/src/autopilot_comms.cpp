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
// Project: seagull_autopilot
// Date:    2014/02/17
// Author:  Pedro Marques da Silva  
// -------------------------------------------------------------------------=
// Description: autopilot_comms.cpp
//
// ==========================================================================
#include <ros/ros.h>
#include <seagull_autopilot/AutopilotComms.h>
/**!
 *
 */
int main(int argc, char **argv) {
	try {
		ros::init(argc, argv, "autopilot_comms");
		AutopilotComms AutopilotComms;
		AutopilotComms.setup();

		ros::Rate loop_rate(100);
		while (ros::ok()) {
			AutopilotComms.loop();
			ros::spinOnce();
			loop_rate.sleep();
		}
	} catch (std::exception &e) {
		printf ("***%s\n",e.what());
		return -1;
	}

	return 0;
}

