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
// Project: seagull_commons-Debug@seagull_commons
// Date:    Jun 23, 2014
// Author: Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: Heartbeater.h
//
// ==========================================================================

#ifndef HEARTBEATER_H_
#define HEARTBEATER_H_
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <time.h>
//!
#include <ros/ros.h>
//!
#include <seagull_commons_msgs/SeagullHeartbeat.h>
/*
 *
 */
class Heartbeater
{
private:
  //! The publisher
  ros::Publisher heartbeatPublisher;
  //!
  ros::NodeHandle& nodeRef;
  //! Id to publish in the heartbeat message
  uint8_t nodeId;
  //!
  pthread_t heartbeatThread;
  //!
  struct timespec interval;
  //!
  bool running;
  //!
  seagull_commons_msgs::SeagullHeartbeat beating;
public:
  /**
   * Constructor
   * @param node Reference to a node handle
   * @param node_id Id of the node to monitor heartbeat status
   * @param interval_ms Interval of the heartbeat publisher (milliseconds)
   * @param topic   Topic to publish to the monitor node
   */
  Heartbeater(ros::NodeHandle &node, const uint8_t node_id, const uint16_t interval_ms, const std::string& topic) :
      running(false),nodeRef(node)
  {

    ROS_INFO("[Heartbeater] - CSTOR Start");
    nodeId = node_id;
    interval.tv_sec = interval_ms / 1000;
    interval.tv_nsec = (interval_ms  % 1000) * 1000000;

    this->heartbeatPublisher = node.advertise<seagull_commons_msgs::SeagullHeartbeat> (topic, 1);
    ROS_INFO("[Heartbeater] - Created publisher for topic: %s",topic.c_str());
    if (pthread_create(&heartbeatThread, NULL, heartbeatFunction, this))
    {
      ROS_ERROR("Error creating thread heartbeatThread: %s", std::strerror(errno));
      throw new std::runtime_error("Heartbeater - fail to create thread");
    }
    ROS_INFO("[Heartbeater] - CSTOR end");
  }

  /**
   * Publish a beat
   */
  void beat()
  {
    this->beating.header.stamp = ros::Time::now();
    this->beating.node = this->nodeId;
    this->heartbeatPublisher.publish(beating);
  }

  /**
   * Thread function
   * @param heartbeaterRef
   */
  static void* heartbeatFunction(void* heartbeaterRef)
  {

    Heartbeater* heartbeater = reinterpret_cast<Heartbeater*>(heartbeaterRef);
    heartbeater->setRunning(true);
    ROS_INFO("[Heartbeater] - Starting thread ");
    while (heartbeater->isRunning()&& heartbeater->getNodeRef().ok())
    {
      heartbeater->beat();
      heartbeater->sleep();
    }
    heartbeater->setRunning(false);
    ROS_INFO("[Heartbeater] - Stopping thread ");

    pthread_exit(NULL);
  }

  /**
   * Wait for next heart beat event
   */
  void sleep()
  {
    nanosleep(&this->interval, (struct timespec *)NULL);
  }

  /**
   * Destructor
   */
  virtual ~Heartbeater()
  {
    ROS_INFO("[Heartbeater] - DSTOR Start");
    setRunning(false);
    pthread_join(heartbeatThread, NULL);
    ROS_INFO("[Heartbeater] - DSTOR end");
  }

  bool isRunning() const
  {
    return running;
  }

  void setRunning(bool running)
  {
    this->running = running;
  }

  const ros::NodeHandle& getNodeRef() const
  {
    return nodeRef;
  }
};

#endif /* HEARTBEATER_H_ */
