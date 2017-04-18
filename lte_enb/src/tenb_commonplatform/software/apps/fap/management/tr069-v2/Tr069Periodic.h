///////////////////////////////////////////////////////////////////////////////
//
// Tr069ConnectionRequest
//
// Wraps the libcsoap interface into an easier to use OO class.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069Periodic_h_
#define __Tr069Periodic_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069QueueableEvent.h"

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


namespace tr069
{


class Periodic : public tr069::Tr069QueueableEvent
{
public:

    Periodic( ) :
        tr069::Tr069QueueableEvent( TR069_EVENT(PERIODIC), TRANSACTION_SESSION_FSM) { }
    virtual ~Periodic(){};
};

}

#endif
