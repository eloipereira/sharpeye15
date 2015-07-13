#!/bin/bash

export ROS_MASTER_URI=http://localhost:11311

rm -rf $HOME/dev/ttyS0
mkdir -p $HOME/dev/

sudo mknod -m 666 $HOME/dev/ttyS0 c 4 64

socat tcp:localhost:2006 PTY,link=$HOME/dev/ttyS0,raw,b57600  &

roslaunch seagull_communication onboard.launch
