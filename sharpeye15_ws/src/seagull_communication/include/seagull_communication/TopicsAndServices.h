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
// Project: seagull_communication
// Date:    2014/02/17
// Author:  Pedro Marques da Silva
// -------------------------------------------------------------------------=
// Description: TopicsAndServices.h
// ==========================================================================


#ifndef SEAGULL_COMMUNICATION_TOPICSANDSERVICES_H_
#define SEAGULL_COMMUNICATION_TOPICSANDSERVICES_H_

#include <string>

namespace seagull_communication
{
namespace topics
{

const static std::string FROM_COMMS_RELAY_TOPIC = "/from_comms_relay";
const static std::string TO_COMMS_RELAY_TOPIC = "/to_comms_relay";
const static std::string COMMS_PARAMETERS_TOPIC = "/comms_parameters";

}  // namespace topics
namespace services
{


}  // namespace services

}  // namespace seagull_communication

#endif /* SEAGULL_COMMUNICATION_TOPICSANDSERVICES_H_ */
