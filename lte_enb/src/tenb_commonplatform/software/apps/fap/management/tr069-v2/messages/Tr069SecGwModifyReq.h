///////////////////////////////////////////////////////////////////////////////
//
// Tr069SecGwModifyReq
//
// Message to request a modification to Security Gateway
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069SecGwModifyReq_h_
#define __Tr069SecGwModifyReq_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <sstream>
#include <boost/shared_ptr.hpp>
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



class SecGwModifyReq : public tr069::Tr069QueueableEvent
{
public:
    typedef enum Mode_tag
    {
        Rewind,
        Next,
        None
    } Mode;

    SecGwModifyReq( Mode mode ) :
        tr069::Tr069QueueableEvent( TR069_EVENT(SECGW_MODIFY_REQ), SECGW_CONNECTION_FSM ),
        m_mode(mode)
    {}
    virtual ~SecGwModifyReq(){};

    /**
     * Getters
     */
    Mode GetMode() const { return m_mode; }

private:
    Mode m_mode;
};

}

#endif