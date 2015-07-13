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
// Project: seagull_communication
// Date:    2014/02/17
// Author:  Pedro Marques da Silva  
// -------------------------------------------------------------------------=
// Description: comms_relay.cpp
//
// ==========================================================================
#include <ros/ros.h>
#include <seagull_communication/CommsRelay.h>

namespace
{

const char* COMMS_RELAY_NODE_NAME = "comms_relay";

}

/**!
 *
 */
int main(int argc, char **argv)
{
  try
  {
    ros::init(argc, argv, COMMS_RELAY_NODE_NAME);
    CommsRelay CommsRelay;
    CommsRelay.setup();
    //!ros::MultiThreadedSpinner spinner(3); // Use 3 threads
      //! REV: spinner.spin(); // spin() will not return until the node has been shutdown

    ros::Rate loop_rate(10);
    while (ros::ok())
    {
     CommsRelay.loop();
      //spinner.spin();
      ros::spinOnce();
      loop_rate.sleep();
    }
  }
  catch (std::exception &e)
  {
    printf("***%s\n", e.what());
    return -1;
  }

  return 0;
}

