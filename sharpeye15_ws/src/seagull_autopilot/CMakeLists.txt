cmake_minimum_required(VERSION 2.8.3)
project(seagull_autopilot)
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(catkin REQUIRED COMPONENTS
    seagull_commons
    seagull_autopilot_msgs
    roscpp 
)

catkin_package(
  INCLUDE_DIRS include 
  CATKIN_DEPENDS roscpp seagull_commons seagull_autopilot_msgs
)

#SET(CATKIN_PACKAGE_PREFIX "/opt/ros/hydro") 
#SET(_CMAKE_INSTALL_DIR ${CATKIN_PACKAGE_PREFIX})
#SET(CMAKE_INSTALL_PREFIX  ${CATKIN_PACKAGE_PREFIX})

if (CI_JENKINS)
    include( Jenkins )    
endif(CI_JENKINS)

###########
## Build ##
###########

if (CI_JENKINS)
    jenkins_includes_dir()
endif(CI_JENKINS)

include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

if (CI_JENKINS)
    jenkins_link_libraries()
endif(CI_JENKINS)

## 
add_executable(autopilot_driver src/autopilot_driver.cpp src/seagull_autopilot/AutopilotDriver.cpp)
add_executable(autopilot_comms src/autopilot_comms.cpp src/seagull_autopilot/AutopilotComms.cpp)

##   
add_dependencies(autopilot_driver seagull_autopilot_msgs_gencpp)
add_dependencies(autopilot_comms seagull_autopilot_msgs_gencpp)

target_link_libraries(autopilot_driver
  ${catkin_LIBRARIES} piccolo arte
)

target_link_libraries(autopilot_comms
  ${catkin_LIBRARIES} arte
)

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

# Mark executables and/or libraries for installation

install(TARGETS autopilot_driver autopilot_comms
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
 )

install(DIRECTORY launch/
    DESTINATION  ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
        PATTERN ".svn" EXCLUDE)

## Mark cpp header files for installation
 install(DIRECTORY include/${PROJECT_NAME}/
     DESTINATION  ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
   FILES_MATCHING PATTERN "*.h"
   PATTERN ".svn" EXCLUDE
 )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
if(CATKIN_ENABLE_TESTING)
    include_directories(include)
    include_directories(
      ${catkin_INCLUDE_DIRS}
    )
    catkin_add_gtest(test_${PROJECT_NAME} test/test_${PROJECT_NAME}.cpp)
    #if(TARGET ${PROJECT_NAME}-test)
        target_link_libraries(test_${PROJECT_NAME} piccolo arte  ${catkin_LIBRARIES})
    #endif()
endif()


#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#        message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "posilva") #required
 
INCLUDE(CPack)
