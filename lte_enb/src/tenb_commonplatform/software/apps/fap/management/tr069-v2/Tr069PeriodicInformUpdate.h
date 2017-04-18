///////////////////////////////////////////////////////////////////////////////
//
// Tr069TransactionSessionComplete
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069PeriodicInformUpdate_h_
#define __Tr069PeriodicInformUpdate_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <sstream>
#include <boost/shared_ptr.hpp>
#include <libcsoap/soap-env.h>
#include <libcsoap/soap-ctx.h>
#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069QueueableEvent.h"

namespace tr069
{

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Typedefs
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Forward Declarations
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////



class PeriodicInformUpdate : public tr069::Tr069QueueableEvent
{

public:
    PeriodicInformUpdate( ) :
        tr069::Tr069QueueableEvent( TR069_EVENT(PERIODIC_INFORM_UPDATE), CWMP_CONNECTION_FSM ) {}
    virtual ~PeriodicInformUpdate(){};

};

}

#endif
