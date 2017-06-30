///////////////////////////////////////////////////////////////////////////////
//
// r069StartTransactionSession.h
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069StartTransactionSession_h_
#define __Tr069StartTransactionSession_h_

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



class StartTransactionSession : public tr069::Tr069QueueableEvent
{
public:
    StartTransactionSession( ) :
        tr069::Tr069QueueableEvent( TR069_EVENT(START_TRANSACTION_SESSION), TRANSACTION_SESSION_FSM){ }

    virtual ~StartTransactionSession(){};
};

}

#endif
