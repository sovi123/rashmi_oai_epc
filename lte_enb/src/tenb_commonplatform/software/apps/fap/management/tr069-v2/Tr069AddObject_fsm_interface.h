///////////////////////////////////////////////////////////////////////////////
//
// Tr069AddObject_fsm_interface.h
//
// Autogenerated from Tr069AddObject.fsm
//
// Fsm Interface Class
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069AddObject_fsm_interface_h_
#define __Tr069AddObject_fsm_interface_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069AddObjectTypes.h"

///////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////

// Definition at end of file
#undef Tr069AddObjectInterfaceDefinition

namespace tr069
{

/*** WARNING: Code AUTO-GENERATED from Tr069AddObject.fsm. Do not edit! ***/
class AddObjectFsmActionSendCreateMibObjectReq
{
public:
    AddObjectFsmActionSendCreateMibObjectReq() {}
    virtual ~AddObjectFsmActionSendCreateMibObjectReq() {}

    typedef enum Outcome_tag
    {
        FSM_ACTION_SUCCESS,
        FSM_ACTION_ADD_OBJECT_NOT_SUPPORTED,
        FSM_ACTION_MAX_ENTRIES_EXCEEDED,
    } Outcome;

    virtual Outcome SendCreateMibObjectReq(shared_ptr<RpcAddObject>) = 0;
};

/*** WARNING: Code AUTO-GENERATED from Tr069AddObject.fsm. Do not edit! ***/
class AddObjectFsmInterface :
    public AddObjectFsmActionSendCreateMibObjectReq
{
public:
    AddObjectFsmInterface() {}
    virtual ~AddObjectFsmInterface() {}
    
    // Actions
    virtual void SendAddObjectResponse(shared_ptr<MibCreateObjectCnf>) = 0;
    
    // Entry/Exit
    virtual void IdleEntry() = 0;
    
    // Guard Conditions
    
};
} // -namespace-

// Auto-updating Interface Definition
#define Tr069AddObjectInterfaceDefinition()  \
    virtual AddObjectFsmActionSendCreateMibObjectReq::Outcome SendCreateMibObjectReq(shared_ptr<RpcAddObject>); \
    virtual void SendAddObjectResponse(shared_ptr<MibCreateObjectCnf>); \
    virtual void IdleEntry()

#endif // __Tr069AddObject_fsm_interface_h_

