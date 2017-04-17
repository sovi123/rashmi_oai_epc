///////////////////////////////////////////////////////////////////////////////
//
// Tr069SecGwConnection_fsm_interface.h
//
// Autogenerated from /mnt/hgfs/Shared/Master_MSPD_CCPU/tenb_commonplatform/software/apps/fap/management/tr069-v2/Tr069SecGwConnection.fsm
//
// Fsm Interface Class
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069SecGwConnection_fsm_interface_h_
#define __Tr069SecGwConnection_fsm_interface_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069ServerConnectionFsmTypes.h"

///////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////

// Definition at end of file
#undef Tr069SecGwConnectionInterfaceDefinition

namespace tr069
{

/*** WARNING: Code AUTO-GENERATED from /mnt/hgfs/Shared/Master_MSPD_CCPU/tenb_commonplatform/software/apps/fap/management/tr069-v2/Tr069SecGwConnection.fsm. Do not edit! ***/
class SecGwConnectionFsmInterface
{
public:
    SecGwConnectionFsmInterface() {}
    virtual ~SecGwConnectionFsmInterface() {}
    
    // Actions
    virtual void PerformInitialisation() = 0;
    virtual void StoreTunnelId(shared_ptr<threeway::Queueable>) = 0;
    virtual void HandleTunnelEstablishment(shared_ptr<threeway::Queueable>) = 0;
    virtual void HandleTunnelEstablishment(shared_ptr<IkeTunnelConnectInd>) = 0;
    virtual void SaveSecGwModify(shared_ptr<SecGwModifyReq>) = 0;
    virtual void RaiseIpsecTunnelFailureAlarm(shared_ptr<threeway::Queueable>) = 0;
    virtual void SystemReboot(void *) = 0;
    virtual void SendTransportCnf(shared_ptr<TransportReq>) = 0;
    virtual void SendTransportRej(shared_ptr<TransportReq>) = 0;
    
    // Entry/Exit
    virtual void DisconnectedEntry() = 0;
    virtual void ConnectionProcedureEntry() = 0;
    virtual void ConnectionProcedureExit() = 0;
    virtual void CreatingIkeTunnelEntry() = 0;
    virtual void ConnectingIkeTunnelEntry() = 0;
    virtual void DeletingIkeTunnelEntry() = 0;
    virtual void ConnectedEntry() = 0;
    virtual void ConnectedExit() = 0;
    virtual void CwmpDisableEntry() = 0;
    virtual void TerminateEntry() = 0;
    virtual void TerminateExit() = 0;
    
    // Guard Conditions
    virtual bool QueryFapRebootInProgress() = 0;
    virtual bool QueryTunnelIdIsAsExpected(shared_ptr<IkeTunnelConnectInd>) = 0;
    virtual bool QueryTunnelIdKnown() = 0;
    virtual bool QueryMinimumNecessaryConfiguration() = 0;
    virtual bool QuerySelectNextServer() = 0;
    virtual bool QueryReconnectServer() = 0;
    virtual bool QueryIpSecIsEnabled(shared_ptr<threeway::Queueable>) = 0;
    
};
} // -namespace-

// Auto-updating Interface Definition
#define Tr069SecGwConnectionInterfaceDefinition()  \
    virtual void PerformInitialisation(); \
    virtual void StoreTunnelId(shared_ptr<threeway::Queueable>); \
    virtual void HandleTunnelEstablishment(shared_ptr<threeway::Queueable>); \
    virtual void HandleTunnelEstablishment(shared_ptr<IkeTunnelConnectInd>); \
    virtual void SaveSecGwModify(shared_ptr<SecGwModifyReq>); \
    virtual void RaiseIpsecTunnelFailureAlarm(shared_ptr<threeway::Queueable>); \
    virtual void SystemReboot(void *); \
    virtual void SendTransportCnf(shared_ptr<TransportReq>); \
    virtual void SendTransportRej(shared_ptr<TransportReq>); \
    virtual void DisconnectedEntry(); \
    virtual void ConnectionProcedureEntry(); \
    virtual void ConnectionProcedureExit(); \
    virtual void CreatingIkeTunnelEntry(); \
    virtual void ConnectingIkeTunnelEntry(); \
    virtual void DeletingIkeTunnelEntry(); \
    virtual void ConnectedEntry(); \
    virtual void ConnectedExit(); \
    virtual void CwmpDisableEntry(); \
    virtual void TerminateEntry(); \
    virtual void TerminateExit(); \
    virtual bool QueryFapRebootInProgress(); \
    virtual bool QueryTunnelIdIsAsExpected(shared_ptr<IkeTunnelConnectInd>); \
    virtual bool QueryTunnelIdKnown(); \
    virtual bool QueryMinimumNecessaryConfiguration(); \
    virtual bool QuerySelectNextServer(); \
    virtual bool QueryReconnectServer(); \
    virtual bool QueryIpSecIsEnabled(shared_ptr<threeway::Queueable>)

#endif // __Tr069SecGwConnection_fsm_interface_h_
