cmake_minimum_required(VERSION 2.8.3)
project(seagull_communication)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  seagull_autopilot
  seagull_autopilot_msgs
  seagull_communication_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp seagull_autopilot seagull_autopilot_msgs seagull_communication_msgs
)
###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a cpp library
# add_library(seagull_communication
#   src/${PROJECT_NAME}/seagull_communication.cpp
# )

## Declare a cpp executable
add_executable(comms_relay     src/comms_relay.cpp 
                               src/seagull_communication/CommsRelay.cpp)
add_executable(Main     test/Main.cpp 
                               src/seagull_communication/CommsRelay.cpp)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
add_dependencies(comms_relay seagull_communication_msgs_generate_messages_cpp)
add_dependencies(comms_relay seagull_autopilot_msgs_generate_messages_cpp)


## Specify libraries to link a library or executable target against
 target_link_libraries(comms_relay
   ${catkin_LIBRARIES}
   arte
   gcov
 )
 target_link_libraries(Main
   ${catkin_LIBRARIES}
   arte
   gcov
 )
#SET(CMAKE_CXX_FLAGS="-g  -O0 -Wall -W -Wshadow -Wunused-variable -Wunused-parameter -Wunused-function -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs -ftest-coverage")
#SET(CMAKE_C_FLAGS="-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
SET(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -O0 -ggdb")
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
# install(TARGETS seagull_communication seagull_communication_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############
set(CMAKE_CXX_FLAGS_DEBUG "-g -Wall")
set(CMAKE_BUILD_TYPE "Release")
## Add gtest based cpp test target and link libraries
if(CATKIN_ENABLE_TESTING)
    include_directories(include)
    include_directories(
      ${catkin_INCLUDE_DIRS}
    )
    catkin_add_gtest(test_CommsRelay test/test_CommsRelay.cpp src/seagull_communication/CommsRelay.cpp
                               )
    catkin_add_gtest(test_CommsRelayG test/test_CommsRelayG.cpp src/seagull_communication/CommsRelay.cpp
                               )  
    catkin_add_gtest(test_CommsRelayB test/test_CommsRelayB.cpp src/seagull_communication/CommsRelay.cpp
                               )
    #if(TARGET ${PROJECT_NAME}-test)
        target_link_libraries(test_CommsRelay  ${catkin_LIBRARIES})
        target_link_libraries(test_CommsRelayB  ${catkin_LIBRARIES})
        target_link_libraries(test_CommsRelayG  ${catkin_LIBRARIES})
    #endif()
endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "posilva") #required
 
INCLUDE(CPack)
