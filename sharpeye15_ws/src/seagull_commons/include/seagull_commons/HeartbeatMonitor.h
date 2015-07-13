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
// Date:    Jun 24, 2014
// Author: Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: HeartbeatMonitor.h
//
// ==========================================================================

#ifndef HEARTBEATMONITOR_H_
#define HEARTBEATMONITOR_H_
//! ROS Headers
#include <ros/ros.h>
#include <ros/callback_queue.h>
//! Seagull Headers
#include <seagull_commons_msgs/SeagullHeartbeat.h>
#include <seagull_commons_msgs/SeagullError.h>
#include <seagull_mavlink/seagull/mavlink.h>
//! Std Headers
#include <string>
#include <map>
#include <vector>
#include <pthread.h>
#include <std_msgs/String.h> //! REV Remove after
#include <sstream>
/*
 *
 */
class HeartbeatMonitor
{

private:
  typedef std::map<uint8_t, bool> NodeStateMap;
  typedef NodeStateMap::iterator NodeStateMapIterator;

  //! The publisher
  ros::Publisher errorPublisher;
  //! Subscriber for heartbeat messages
  ros::Subscriber heartbeatSubscriber;
  //! Thread to monitor heartbeat
  pthread_t monitorThread;
  //! Check vector
  NodeStateMap monitoredNodes;
  //!
  struct timespec interval;
  //! Flag to control the thread execution
  bool running;
  //!
  ros::CallbackQueue heartbeatQueue;
  //!
  ros::NodeHandle * node;

  ros::AsyncSpinner *spinner;

  pthread_mutex_t monitorLock;
public:
  /**
   *
   * @param interval_ms Interval for checking heartbeat status (miliseconds)
   * @param hb_topic    Topic to receive heartbeat
   * @param err_topic   Topic to publish errors
   */
  HeartbeatMonitor(const uint16_t interval_ms, const std::string& hb_topic, const std::string& err_topic) :
      running(false), node(0), spinner(0), monitorThread(0)
  {
    this->initialize(interval_ms, hb_topic, err_topic);
  }
  /**
   *
   * @param interval_ms Interval for checking heartbeat status (miliseconds)
   * @param hb_topic    Topic to receive heartbeat
   * @param err_topic   Topic to publish errors
   * @param nodes2monitor List of node Ids to monitor
   */
  HeartbeatMonitor(const uint16_t interval_ms, const std::string& hb_topic, const std::string& err_topic,
                   const std::vector<uint8_t> &nodes2monitor) :
      running(false), node(0), spinner(0), monitorThread(0)
  {
    // Initialize monitored nodes with knowed IDS
    for (int n = 0; n < nodes2monitor.size(); ++n)
    {
      monitoredNodes[nodes2monitor[n]] = true; // Start with true to give a chance to the nodes to announce him self
    }
    this->initialize(interval_ms, hb_topic, err_topic);
  }

  /**
   * Contructor helper
   * @param interval_ms
   * @param hb_topic
   * @param err_topic
   */
  void initialize(const uint16_t interval_ms, const std::string& hb_topic, const std::string& err_topic)
  {
    ROS_INFO("[HeartbeatMonitor] - CSTOR start");

    if (pthread_mutex_init(&monitorLock, NULL) != 0)
    {
      ROS_ERROR(" [HeartbeatMonitor]  Error creating thread monitorLock mutex: %s", std::strerror(errno));
      throw new std::runtime_error("[HeartbeatMonitor] - failed to create mutex");
    }

    //! Set check interval time struct
    interval.tv_sec = interval_ms / 1000;
    interval.tv_nsec = (interval_ms % 1000) * 1000000;
    //! Create custom node handle with custom callback_queue
    this->node = new ros::NodeHandle("~");
    node->setCallbackQueue(&heartbeatQueue);

    //! Create the subscriber and the publisher
    this->errorPublisher = node->advertise<seagull_commons_msgs::SeagullError>(err_topic, 10);
    ROS_INFO("[HeartbeatMonitor] - Publish error state to %s", err_topic.c_str());
    this->heartbeatSubscriber = node->subscribe(hb_topic, 20, &HeartbeatMonitor::heartbeatCallback, this);
    ROS_INFO("[HeartbeatMonitor] - Subscribe Heartbeat to %s", hb_topic.c_str());

    //! Create monitor thread
    if (pthread_create(&monitorThread, NULL, monitorFunction, this))
    {
      ROS_ERROR("Error creating thread monitorThread: %s", std::strerror(errno));
      throw new std::runtime_error("HeartbeatMonitor - fail to create thread");
    }
    ROS_INFO("[HeartbeatMonitor] - Thread created ");
    //! Run Spinner
    spinner = new ros::AsyncSpinner(0, &heartbeatQueue);
    spinner->start();
    ROS_INFO("[HeartbeatMonitor] - Start Spinner");
    ROS_INFO("[HeartbeatMonitor] - CSTOR end");
  }
  /**
   *
   * @param msg
   */
  void heartbeatCallback(const seagull_commons_msgs::SeagullHeartbeat::ConstPtr& msg)
  {
    //ROS_WARN("[HeartbeatMonitor] - Received a HeartBeat from %d", msg->node);
    pthread_mutex_lock(&monitorLock);
    monitoredNodes[msg->node] = true;
    pthread_mutex_unlock(&monitorLock);
  }

  /**
   * Release allocated resources
   */
  virtual ~HeartbeatMonitor()
  {
    ROS_INFO("[HeartbeatMonitor] - DSTOR Start");
    setRunning(false); //! signal thread execution stop
    //! wait for thread
    pthread_join(monitorThread, NULL);
    pthread_mutex_destroy(&monitorLock);

    //! Stop spinner
    spinner->stop();
    delete spinner;
    //! disable callback queue
    this->heartbeatQueue.clear();
    this->heartbeatQueue.disable();
    //! Release node
    this->node->shutdown();
    delete this->node;
    ROS_INFO("[HeartbeatMonitor] - DSTOR end");
  }

  /**
   * Thread function to handle monitoring action
   * @param monitorRef
   */
  static void* monitorFunction(void* monitorRef)
  {

    HeartbeatMonitor* monitor = reinterpret_cast<HeartbeatMonitor*>(monitorRef);
    monitor->setRunning(true);
    while (monitor->isRunning() && monitor->getNode()->ok())
    {
      monitor->check();
      monitor->sleep();
    }
    monitor->setRunning(false);

    pthread_exit(NULL);
  }
  /**
   * Check the heartbeat nodes
   */
  void check()
  {
    //ROS_INFO("[HeartbeatMonitor] - Checking nodes");
    pthread_mutex_lock(&monitorLock);
    for (NodeStateMapIterator it = monitoredNodes.begin(); it != monitoredNodes.end(); ++it)
    {
      if (!it->second)
      {
        seagull_commons_msgs::SeagullError se;
        std::stringstream ss;
        ss << "Heartbeat Failed from Node: " << (int)it->first;
        se.errorMsg = ss.str();
        se.errorType = HEARTBEAT;
        se.errorNode = (int)it->first;
        errorPublisher.publish(se);
      }
      monitoredNodes[it->first] = false;
    }
    pthread_mutex_unlock(&monitorLock);
  }

  /**
   * Wait for next heart beat event
   */
  void sleep()
  {
    nanosleep(&this->interval, (struct timespec *)NULL);
  }
  /**
   *
   * @return
   */
  bool isRunning() const
  {
    return running;
  }

  /**
   *
   * @param running
   */
  void setRunning(bool running)
  {
    this->running = running;
  }

  /**
   *
   * @return
   */
  const ros::NodeHandle* getNode() const
  {
    return node;
  }
};

#endif /* HEARTBEATMONITOR_H_ */
