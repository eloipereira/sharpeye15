// ==========================================================================
// Copyright (C) 2013 Portuguese Air Force Academy                       =
// Research Center                                                          =
// Granja do Marques, Academia, Pero-Pinheiro                               =
// ==========================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
// ==========================================================================
// Project: seagull
// Date:    9:46:12 AM
// Author:  posilva
// -------------------------------------------------------------------------=
// Change Log:
// -------------------------------------------------------------------------=
// Date       / Author              /Description
// ==========================================================================
// Description: ROSNode.h
//
// ==========================================================================

#ifndef ROSNODE_H_
#define ROSNODE_H_
#include <ros/ros.h>

class ROSNode
{
public:
  ROSNode(bool local=true);
  virtual
  ~ROSNode();
  virtual void
  setup()=0;
  virtual void
  loop()=0;

  ros::NodeHandle&
  getHandle()
  {
    return *handle_;
  }
  template<typename T>
    bool
    readParam(const std::string& name, T& value, T defvalue)
    {
      if (getHandle().hasParam(name))
      {
        if (!getHandle().getParam(name, value))
        {
          ROS_WARN("Parameter '%s' data type error!", name.c_str());
          value = defvalue;
          return false;
        }
      }
      else
      {
        ROS_WARN("Parameter '%s' missing!", name.c_str());
        value = defvalue;
        return false;
      }
      return true;
    }
protected:

  //! Ros Node handle
  ros::NodeHandle * handle_;

};

#endif /* ROSNODE_H_ */
