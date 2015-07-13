/*
 * TopicsAndServices.h
 *
 *  Created on: Jun 16, 2014
 *  	Author: dasalgueiro
 */


#ifndef SEAGULL_COMMONS_TOPICSANDSERVICES_H_
#define SEAGULL_COMMONS_TOPICSANDSERVICES_H_

#include <string>

namespace seagull_commons
{
namespace topics
{


// this topic is declared here to avoid circular dependencies between packages
const static std::string TO_SEP_HEARTBEAT_TOPIC = "/to_sep_heartbeat";
// this topic is declared here to maintain the consistency with TO_SEP_HEARTBEAT_TOPIC
const static std::string TO_SEC2_HEARTBEAT_TOPIC = "/to_sec2_heartbeat";

const static std::string SEAGULL_ERROR_TOPIC = "/seagull_error";
}  // namespace topics

}  // namespace seagull_commons

#endif /* SEAGULL_COMMONS_TOPICSANDSERVICES_H_ */
