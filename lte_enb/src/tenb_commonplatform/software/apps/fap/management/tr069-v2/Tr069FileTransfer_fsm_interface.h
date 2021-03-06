///////////////////////////////////////////////////////////////////////////////
//
// Tr069FileTransfer_fsm_interface.h
//
// Autogenerated from Tr069FileTransfer.fsm
//
// Fsm Interface Class
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069FileTransfer_fsm_interface_h_
#define __Tr069FileTransfer_fsm_interface_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/ThreadWithQueue.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069FileTransferTypes.h"

///////////////////////////////////////////////////////////////////////////////
// Defines
///////////////////////////////////////////////////////////////////////////////

// Definition at end of file
#undef Tr069FileTransferInterfaceDefinition

namespace tr069
{

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
class FileTransferFsmInterface
{
public:
    FileTransferFsmInterface() {}
    virtual ~FileTransferFsmInterface() {}
    
    // Actions
    virtual void SendFtpAbort(void*) = 0;
    virtual void StoreFtpCommand(shared_ptr<FtpSessionCommand>) = 0;
    virtual void StoreFtpCnfId(shared_ptr<FtpCnf>) = 0;
    virtual void StoreFtpCompleteInd(shared_ptr<FtpCompleteInd>) = 0;
    virtual void SendUploadSuccess() = 0;
    virtual void SendUploadFailed() = 0;
    virtual void RebootIntoNewSwLoad(shared_ptr<ActivateUpdateCnf>) = 0;
    
    // Entry/Exit
    virtual void AwaitTransportCnfEntry() = 0;
    virtual void InProcedureEntry() = 0;
    virtual void InProcedureExit() = 0;
    virtual void ActivatingSwPackageEntry() = 0;
    virtual void WaitFtpThreadResponseEntry() = 0;
    virtual void WaitFtpThreadResponseExit() = 0;
    virtual void WaitFtpCnfEntry() = 0;
    virtual void FileTransferSucceededEntry() = 0;
    virtual void InstallUpdateEntry() = 0;
    virtual void SendDownloadSucceededResponseEntry() = 0;
    virtual void SendDownloadFailedResponseEntry() = 0;
    virtual void SendDownloadInvalidResponseEntry() = 0;
    
    // Guard Conditions
    virtual bool QueryFtpSuccessful(shared_ptr<FtpCompleteInd>) = 0;
    virtual bool QueryFtpSuccessful() = 0;
    virtual bool QueryFtpAlreadyRetried(shared_ptr<FtpCompleteInd>) = 0;
    virtual bool QueryUpload() = 0;
    virtual bool QuerySwLoad() = 0;
    virtual bool QuerySwTransfer() = 0;
    virtual bool QueryInstallUpdateSucceeded(shared_ptr<InstallUpdateCnf>) = 0;
    virtual bool QueryActivateUpdateSucceeded(shared_ptr<ActivateUpdateCnf>) = 0;
    virtual bool QueryTransportOk(shared_ptr<TransportCnf>) = 0;
    
};
} // -namespace-

// Auto-updating Interface Definition
#define Tr069FileTransferInterfaceDefinition()  \
    virtual void SendFtpAbort(void*); \
    virtual void StoreFtpCommand(shared_ptr<FtpSessionCommand>); \
    virtual void StoreFtpCnfId(shared_ptr<FtpCnf>); \
    virtual void StoreFtpCompleteInd(shared_ptr<FtpCompleteInd>); \
    virtual void SendUploadSuccess(); \
    virtual void SendUploadFailed(); \
    virtual void RebootIntoNewSwLoad(shared_ptr<ActivateUpdateCnf>); \
    virtual void AwaitTransportCnfEntry(); \
    virtual void InProcedureEntry(); \
    virtual void InProcedureExit(); \
    virtual void ActivatingSwPackageEntry(); \
    virtual void WaitFtpThreadResponseEntry(); \
    virtual void WaitFtpThreadResponseExit(); \
    virtual void WaitFtpCnfEntry(); \
    virtual void FileTransferSucceededEntry(); \
    virtual void InstallUpdateEntry(); \
    virtual void SendDownloadSucceededResponseEntry(); \
    virtual void SendDownloadFailedResponseEntry(); \
    virtual void SendDownloadInvalidResponseEntry(); \
    virtual bool QueryFtpSuccessful(shared_ptr<FtpCompleteInd>); \
    virtual bool QueryFtpSuccessful(); \
    virtual bool QueryFtpAlreadyRetried(shared_ptr<FtpCompleteInd>); \
    virtual bool QueryUpload(); \
    virtual bool QuerySwLoad(); \
    virtual bool QuerySwTransfer(); \
    virtual bool QueryInstallUpdateSucceeded(shared_ptr<InstallUpdateCnf>); \
    virtual bool QueryActivateUpdateSucceeded(shared_ptr<ActivateUpdateCnf>); \
    virtual bool QueryTransportOk(shared_ptr<TransportCnf>)

#endif // __Tr069FileTransfer_fsm_interface_h_

