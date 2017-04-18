///////////////////////////////////////////////////////////////////////////////
//
// Tenpin_fsm_interface.h
//
// Autogenerated from Tenpin.fsm
//
// Fsm Interface Class
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tenpin_fsm_interface_h_
#define __Tenpin_fsm_interface_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "TenpinFsmTypes.h"

///////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////

// Definition at end of file
#undef TenpinInterfaceDefinition

namespace Tenpin
{

/*** WARNING: Code AUTO-GENERATED from Tenpin.fsm. Do not edit! ***/
class TenpinFsmInterface
{
public:
    TenpinFsmInterface() {}
    virtual ~TenpinFsmInterface() {}
    
    // Actions
    virtual void Extract(void*) = 0;
    virtual void DnsServerAdd(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void FirewallOpen(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void FirewallOpened(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void FirewallClose(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void FirewallClosed(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void SignatureVerifyFailed(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void SignatureVerifyTest(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void StoreAttributes(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void TunnelCreate(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void TunnelDelete(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void TunnelConnected(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void TunnelDisconnected(shared_ptr<threeway::MessageSerialisedData>) = 0;
    virtual void HwCryptoCtrl(shared_ptr<threeway::MessageSerialisedData>) = 0;
    
    // Entry/Exit
    virtual void UnusableEntry() = 0;
    virtual void NotConfiguredEntry() = 0;
    virtual void NotConfiguredExit() = 0;
    virtual void NotStartedEntry() = 0;
    virtual void StartingEntry() = 0;
    virtual void StartingExit() = 0;
    virtual void StartedEntry() = 0;
    virtual void OperationalEntry() = 0;
    virtual void OperationalExit() = 0;
    
    // Guard Conditions
    virtual bool CheckUsable() = 0;
    
};
} // -namespace-

// Auto-updating Interface Definition
#define TenpinInterfaceDefinition()  \
    virtual void Extract(void*); \
    virtual void DnsServerAdd(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void FirewallOpen(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void FirewallOpened(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void FirewallClose(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void FirewallClosed(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void SignatureVerifyFailed(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void SignatureVerifyTest(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void StoreAttributes(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void TunnelCreate(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void TunnelDelete(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void TunnelConnected(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void TunnelDisconnected(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void HwCryptoCtrl(shared_ptr<threeway::MessageSerialisedData>); \
    virtual void UnusableEntry(); \
    virtual void NotConfiguredEntry(); \
    virtual void NotConfiguredExit(); \
    virtual void NotStartedEntry(); \
    virtual void StartingEntry(); \
    virtual void StartingExit(); \
    virtual void StartedEntry(); \
    virtual void OperationalEntry(); \
    virtual void OperationalExit(); \
    virtual bool CheckUsable()

#endif // __Tenpin_fsm_interface_h_

