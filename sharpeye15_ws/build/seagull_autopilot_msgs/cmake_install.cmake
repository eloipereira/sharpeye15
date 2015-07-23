# Install script for directory: /home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/eloi/sharpeye15/sharpeye15_ws/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/seagull_autopilot_msgs/msg" TYPE FILE FILES
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotCommand.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotTelemetry.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotTrack.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotStatus.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotWaypoint.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotWPList.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotPayload.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotRequestWaypoints.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotWarning.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotADCSamples.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotMissionLimits.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotMissionSettings.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotUserAction.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotZeroLength.msg"
    "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/msg/AutopilotGimbalPayload.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/seagull_autopilot_msgs/cmake" TYPE FILE FILES "/home/eloi/sharpeye15/sharpeye15_ws/build/seagull_autopilot_msgs/catkin_generated/installspace/seagull_autopilot_msgs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/eloi/sharpeye15/sharpeye15_ws/devel/include/seagull_autopilot_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/eloi/sharpeye15/sharpeye15_ws/devel/share/common-lisp/ros/seagull_autopilot_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/eloi/sharpeye15/sharpeye15_ws/devel/lib/python2.7/dist-packages/seagull_autopilot_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/eloi/sharpeye15/sharpeye15_ws/devel/lib/python2.7/dist-packages/seagull_autopilot_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/eloi/sharpeye15/sharpeye15_ws/build/seagull_autopilot_msgs/catkin_generated/installspace/seagull_autopilot_msgs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/seagull_autopilot_msgs/cmake" TYPE FILE FILES "/home/eloi/sharpeye15/sharpeye15_ws/build/seagull_autopilot_msgs/catkin_generated/installspace/seagull_autopilot_msgs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/seagull_autopilot_msgs/cmake" TYPE FILE FILES
    "/home/eloi/sharpeye15/sharpeye15_ws/build/seagull_autopilot_msgs/catkin_generated/installspace/seagull_autopilot_msgsConfig.cmake"
    "/home/eloi/sharpeye15/sharpeye15_ws/build/seagull_autopilot_msgs/catkin_generated/installspace/seagull_autopilot_msgsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/seagull_autopilot_msgs" TYPE FILE FILES "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/seagull_autopilot_msgs" TYPE DIRECTORY FILES "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_autopilot_msgs/include/seagull_autopilot_msgs/" FILES_MATCHING REGEX "/[^/]*\\.h$" REGEX "/\\.svn$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

