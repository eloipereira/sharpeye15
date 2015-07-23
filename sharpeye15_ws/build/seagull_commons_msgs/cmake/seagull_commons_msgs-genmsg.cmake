# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "seagull_commons_msgs: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iseagull_commons_msgs:/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genjava REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(seagull_commons_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" NAME_WE)
add_custom_target(_seagull_commons_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "seagull_commons_msgs" "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" NAME_WE)
add_custom_target(_seagull_commons_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "seagull_commons_msgs" "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" NAME_WE)
add_custom_target(_seagull_commons_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "seagull_commons_msgs" "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" "seagull_commons_msgs/SeagullHeader:std_msgs/Header"
)

get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" NAME_WE)
add_custom_target(_seagull_commons_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "seagull_commons_msgs" "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genjava;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_cpp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_cpp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg"
  "${MSG_I_FLAGS}"
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_cpp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(seagull_commons_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(seagull_commons_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(seagull_commons_msgs_generate_messages seagull_commons_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_cpp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_cpp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_cpp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_cpp _seagull_commons_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(seagull_commons_msgs_gencpp)
add_dependencies(seagull_commons_msgs_gencpp seagull_commons_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS seagull_commons_msgs_generate_messages_cpp)

### Section generating for lang: genjava
### Generating Messages
_generate_msg_java(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_java(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_java(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg"
  "${MSG_I_FLAGS}"
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_java(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
)

### Generating Services

### Generating Module File
_generate_module_java(seagull_commons_msgs
  ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
  "${ALL_GEN_OUTPUT_FILES_java}"
)

add_custom_target(seagull_commons_msgs_generate_messages_java
  DEPENDS ${ALL_GEN_OUTPUT_FILES_java}
)
add_dependencies(seagull_commons_msgs_generate_messages seagull_commons_msgs_generate_messages_java)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_java _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_java _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_java _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_java _seagull_commons_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(seagull_commons_msgs_genjava)
add_dependencies(seagull_commons_msgs_genjava seagull_commons_msgs_generate_messages_java)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS seagull_commons_msgs_generate_messages_java)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_lisp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_lisp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg"
  "${MSG_I_FLAGS}"
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_lisp(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(seagull_commons_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(seagull_commons_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(seagull_commons_msgs_generate_messages seagull_commons_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_lisp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_lisp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_lisp _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_lisp _seagull_commons_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(seagull_commons_msgs_genlisp)
add_dependencies(seagull_commons_msgs_genlisp seagull_commons_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS seagull_commons_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_py(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_py(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg"
  "${MSG_I_FLAGS}"
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
)
_generate_msg_py(seagull_commons_msgs
  "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(seagull_commons_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(seagull_commons_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(seagull_commons_msgs_generate_messages seagull_commons_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullError.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_py _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeader.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_py _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/CommsParameters.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_py _seagull_commons_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/eloi/sharpeye15/sharpeye15_ws/src/seagull_commons_msgs/msg/SeagullHeartbeat.msg" NAME_WE)
add_dependencies(seagull_commons_msgs_generate_messages_py _seagull_commons_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(seagull_commons_msgs_genpy)
add_dependencies(seagull_commons_msgs_genpy seagull_commons_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS seagull_commons_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/seagull_commons_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(seagull_commons_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genjava_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genjava_INSTALL_DIR}/seagull_commons_msgs
    DESTINATION ${genjava_INSTALL_DIR}
  )
endif()
add_dependencies(seagull_commons_msgs_generate_messages_java std_msgs_generate_messages_java)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/seagull_commons_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(seagull_commons_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/seagull_commons_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(seagull_commons_msgs_generate_messages_py std_msgs_generate_messages_py)
