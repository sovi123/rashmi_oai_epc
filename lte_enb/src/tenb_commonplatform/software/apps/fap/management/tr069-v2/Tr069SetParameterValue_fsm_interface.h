///////////////////////////////////////////////////////////////////////////////
//
// Tr069SetParameterValue_fsm_interface.h
//
// Autogenerated from Tr069SetParameterValue.fsm
//
// Fsm Interface Class
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069SetParameterValue_fsm_interface_h_
#define __Tr069SetParameterValue_fsm_interface_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069SetParameterValueTypes.h"

///////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////

// Definition at end of file
#undef Tr069SetParameterValueInterfaceDefinition

namespace tr069
{

/*** WARNING: Code AUTO-GENERATED from Tr069SetParameterValue.fsm. Do not edit! ***/
class SpvFsmInterface
{
public:
    SpvFsmInterface() {}
    virtual ~SpvFsmInterface() {}
    
    // Actions
    virtual void StoreSetRequest(shared_ptr<RpcSetParameterValue>) = 0;
    virtual void SendSetParametersReject() = 0;
    virtual void SendSetParametersConfirm() = 0;
    virtual void SendSetMibAttributes(shared_ptr<MibValidateAttributesCnf>) = 0;
    
    // Entry/Exit
    virtual void SettingEntry() = 0;
    virtual void SettingExit() = 0;
    virtual void AwaitDataModelVerifyCnfEntry() = 0;
    virtual void AwaitDataModelVerifyCnfExit() = 0;
    virtual void AwaitMibVerifyCnfEntry() = 0;
    virtual void AwaitMibVerifyCnfExit() = 0;
    
    // Guard Conditions
    virtual bool QueryEmptySet() = 0;
    virtual bool QueryVerified(shared_ptr<DataModelVerifyCnf>) = 0;
    virtual bool QueryVerified(shared_ptr<MibValidateAttributesCnf>) = 0;
    
};
} // -namespace-

// Auto-updating Interface Definition
#define Tr069SetParameterValueInterfaceDefinition()  \
    virtual void StoreSetRequest(shared_ptr<RpcSetParameterValue>); \
    virtual void SendSetParametersReject(); \
    virtual void SendSetParametersConfirm(); \
    virtual void SendSetMibAttributes(shared_ptr<MibValidateAttributesCnf>); \
    virtual void SettingEntry(); \
    virtual void SettingExit(); \
    virtual void AwaitDataModelVerifyCnfEntry(); \
    virtual void AwaitDataModelVerifyCnfExit(); \
    virtual void AwaitMibVerifyCnfEntry(); \
    virtual void AwaitMibVerifyCnfExit(); \
    virtual bool QueryEmptySet(); \
    virtual bool QueryVerified(shared_ptr<DataModelVerifyCnf>); \
    virtual bool QueryVerified(shared_ptr<MibValidateAttributesCnf>)

#endif // __Tr069SetParameterValue_fsm_interface_h_

