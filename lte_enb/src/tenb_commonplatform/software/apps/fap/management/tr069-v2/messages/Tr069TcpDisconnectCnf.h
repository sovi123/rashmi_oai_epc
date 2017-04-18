///////////////////////////////////////////////////////////////////////////////
//
// Tr069TcpDisconnectCnf
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069TcpDisconnectCnf_h_
#define __Tr069TcpDisconnectCnf_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

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



class TcpDisconnectCnf : public tr069::Tr069QueueableEvent
{
public:

    TcpDisconnectCnf( ) :
        tr069::Tr069QueueableEvent( TR069_EVENT(TCP_DISCONNECT_CNF), TRANSACTION_SESSION_FSM ) { }
    virtual ~TcpDisconnectCnf(){};

private:
};

}

#endif
