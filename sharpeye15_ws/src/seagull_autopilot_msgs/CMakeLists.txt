cmake_minimum_required(VERSION 2.8.3)
project(seagull_autopilot_msgs)

find_package(catkin REQUIRED COMPONENTS
  roscpp rospy message_generation seagull_commons_msgs
)

################################################
## Declare ROS messages, services and actions ##
################################################

add_message_files(
    FILES
    AutopilotCommand.msg
    AutopilotTelemetry.msg
    AutopilotTrack.msg
    AutopilotStatus.msg
    AutopilotWaypoint.msg
    AutopilotWPList.msg
    AutopilotPayload.msg
    AutopilotRequestWaypoints.msg
    AutopilotWarning.msg
    AutopilotADCSamples.msg
    AutopilotMissionLimits.msg
    AutopilotMissionSettings.msg
    AutopilotUserAction.msg
    AutopilotZeroLength.msg
    AutopilotGimbalPayload.msg
   
)



## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   seagull_commons_msgs
   std_msgs  # Or other packages containing msgs
 )
###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES seagull_autopilot_msgs
  CATKIN_DEPENDS roscpp rospy message_runtime seagull_commons_msgs
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a cpp library
# add_library(seagull_autopilot_msgs
#   src/${PROJECT_NAME}/seagull_autopilot_msgs.cpp
# )

## Declare a cpp executable
# add_executable(seagull_autopilot_msgs_node src/seagull_autopilot_msgs_node.cpp)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
# add_dependencies(seagull_autopilot_msgs_node seagull_autopilot_msgs_generate_messages_cpp)

## Specify libraries to link a library or executable target against
# target_link_libraries(seagull_autopilot_msgs_node
#   ${catkin_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS seagull_autopilot_msgs seagull_autopilot_msgs_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
 install(DIRECTORY include/${PROJECT_NAME}/
   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
   FILES_MATCHING PATTERN "*.h"
   PATTERN ".svn" EXCLUDE
 )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_seagull_autopilot_msgs.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
