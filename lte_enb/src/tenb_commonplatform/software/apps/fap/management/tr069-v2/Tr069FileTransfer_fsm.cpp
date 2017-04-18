///////////////////////////////////////////////////////////////////////////////
//
//Tr069FileTransfer_fsm.cpp
//
// Autogenerated from Tr069FileTransfer.fsm
//
// See header file for documentation.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <sstream>
#include <iostream>
#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr069FileTransfer_fsm.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////

using namespace tr069;

namespace tr069
{

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
FileTransferFsm::FileTransferFsm(
    FileTransferFsmInterface & interfaceClass,
    bool traceEnabled,
    const char * name 
    ) :
    mInterface(interfaceClass),
    mFsmTraceEnabled(traceEnabled),
    mName(name),
    mState(NULL),
    mIdle(*this ),
    mAwaitTransportCnf(*this ),
    mInProcedure(*this ),
    mActivatingSwPackage(*this ),
    mWaitFtpThreadResponse(*this ),
    mWaitFtpCnf(*this ),
    mWaitFtpCompleteInd(*this ),
    mFileTransferSucceeded(*this ),
    mTransferSucceededJunction(*this ),
    mNewSwPackage(*this ),
    mSwLoad(*this ),
    mInstallUpdate(*this ),
    mInstallUpdateOnly(*this ),
    mInstallUpdateThenActivate(*this ),
    mTransferComplete(*this ),
    mSendResponse(*this ),
    mSendUploadResponse(*this ),
    mSendDownloadResponse(*this ),
    mSendDownloadSucceededResponse(*this ),
    mSendDownloadFailedResponse(*this ),
    mSendDownloadInvalidResponse(*this ),
    mResponseSent(*this ),
    mGoInactive(*this ),
    mfsmEventQueue(),
    mFsmInjectInProgress(false),
    mEventCounter(0)
{
    // Initial State
    mIdle.Entry();

    if(NULL != mState)
    {
       while( !mState->RunToCompletion() )
       {
          continue;
       }
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
FileTransferFsm::~FileTransferFsm()
{
    RSYS_ASSERT_PRINTF(!mFsmInjectInProgress, "FileTransferFsm deleted while event-inject in progress.");

    mfsmEventQueue.clear();
    mCurrentStateTransitionExitsList.clear();
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectFtpSessionCommand(shared_ptr<FtpSessionCommand> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_FtpSessionCommand_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_FtpSessionCommand, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectActivateSoftware(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_ActivateSoftware, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectFtpCnf(shared_ptr<FtpCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_FtpCnf_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_FtpCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectFtpCompleteInd(shared_ptr<FtpCompleteInd> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_FtpCompleteInd_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_FtpCompleteInd, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectTimerExpiry(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_TimerExpiry, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectFileOk(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_FileOk, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectApplyUpdateCnf(shared_ptr<ApplyUpdateCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_ApplyUpdateCnf_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_ApplyUpdateCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectInstallUpdateCnf(shared_ptr<InstallUpdateCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_InstallUpdateCnf_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_InstallUpdateCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectActivateUpdateCnf(shared_ptr<ActivateUpdateCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_ActivateUpdateCnf_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_ActivateUpdateCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InjectTransportCnf(shared_ptr<TransportCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_TransportCnf_GT_(event));
    Enqueue( FileTransferFsm::FSM_EVENT_TransportCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::Enqueue( EventId eventId, shared_ptr<FsmEvent> fsmEvent )
{
    RSYS_ASSERT(eventId < NUMBER_OF_INJECTABLE_EVENTS);

    // Reentrancy Protection is NOT intended to make thread-safe
    shared_ptr<QueuedFsmEvent>  qEvent(new QueuedFsmEvent(eventId, fsmEvent));
    mfsmEventQueue.push_back(qEvent);

    if(!mFsmInjectInProgress)
    {
        mFsmInjectInProgress = true;

        list< shared_ptr<QueuedFsmEvent> >::iterator event = mfsmEventQueue.begin();

        while( event != mfsmEventQueue.end() )
        {
            RSYS_ASSERT(*event);
            RSYS_ASSERT(mState);

            EventId queuedEventId = (*event)->mId;

            RSYS_ASSERT(queuedEventId < NUMBER_OF_INJECTABLE_EVENTS);

            if( !mState->DeferEvent( queuedEventId ) )
            {
                ++mEventCounter;

                if(mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s <--(%s)-- ", mName.c_str(), mEventCounter, mState->mName.c_str(), mEventName[queuedEventId] ); }

                mState->Inject(queuedEventId, (*event)->mFsmEvent);

                while( !mState->RunToCompletion() )
                {
                    continue;
                }

                mfsmEventQueue.erase(event);
                event = mfsmEventQueue.begin();
            }
            else
            {
                if(mFsmTraceEnabled) { TRACE_PRINTF("%s.-: %s (%s deferred)", mName.c_str(), mState->mName.c_str(), mEventName[queuedEventId] ); };
                event++;
            }
        }

        mFsmInjectInProgress = false;
    }
    else
    {
        if(mFsmTraceEnabled) { TRACE_PRINTF("%s.-: (%s enqueued)", mName.c_str(), mEventName[eventId] ); }
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
const char * FileTransferFsm::mEventName[NUMBER_OF_INJECTABLE_EVENTS] =
{
    "FtpSessionCommand",
    "ActivateSoftware",
    "FtpCnf",
    "FtpCompleteInd",
    "TimerExpiry",
    "FileOk",
    "ApplyUpdateCnf",
    "InstallUpdateCnf",
    "ActivateUpdateCnf",
    "TransportCnf",
};

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SimpleState::Inject(
    EventId eventId,
    shared_ptr<FsmEvent> fsmEvent
    )
{
    RSYS_ASSERT(eventId < NUMBER_OF_INJECTABLE_EVENTS);

    switch(eventId)
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_FtpSessionCommand_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_FtpSessionCommand_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_FtpSessionCommand_GT_>(fsmEvent);
            InjectFtpSessionCommand(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectActivateSoftware(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_FtpCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_FtpCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_FtpCnf_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_FtpCnf_GT_>(fsmEvent);
            InjectFtpCnf(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_FtpCompleteInd:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_FtpCompleteInd_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_FtpCompleteInd_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_FtpCompleteInd_GT_>(fsmEvent);
            InjectFtpCompleteInd(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_TimerExpiry:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectTimerExpiry(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_FileOk:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectFileOk(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_ApplyUpdateCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_ApplyUpdateCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_ApplyUpdateCnf_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_ApplyUpdateCnf_GT_>(fsmEvent);
            InjectApplyUpdateCnf(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_InstallUpdateCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_InstallUpdateCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_InstallUpdateCnf_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_InstallUpdateCnf_GT_>(fsmEvent);
            InjectInstallUpdateCnf(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_ActivateUpdateCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_ActivateUpdateCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_ActivateUpdateCnf_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_ActivateUpdateCnf_GT_>(fsmEvent);
            InjectActivateUpdateCnf(event->mEvent);
        }
        break;

        case FileTransferFsm::FSM_EVENT_TransportCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_TransportCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_TransportCnf_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_TransportCnf_GT_>(fsmEvent);
            InjectTransportCnf(event->mEvent);
        }
        break;

        default:
            RSYS_ASSERT(false);
            break;
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::Idle::InjectFtpSessionCommand(
    shared_ptr<FtpSessionCommand> event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action StoreFtpCommand" );

        mFsm.mInterface.StoreFtpCommand(event);

        mFsm.mAwaitTransportCnf.Entry();
    }
}

// Event ActivateSoftware not handled in state Idle

// Event FtpCnf not handled in state Idle

// Event FtpCompleteInd not handled in state Idle

// Event TimerExpiry not handled in state Idle

// Event FileOk not handled in state Idle

// Event ApplyUpdateCnf not handled in state Idle

// Event InstallUpdateCnf not handled in state Idle

// Event ActivateUpdateCnf not handled in state Idle

// Event TransportCnf not handled in state Idle

// State Idle has no deferred events.

// Event FtpSessionCommand not handled in state AwaitTransportCnf

// Event ActivateSoftware not handled in state AwaitTransportCnf

// Event FtpCnf not handled in state AwaitTransportCnf

// Event FtpCompleteInd not handled in state AwaitTransportCnf

// Event TimerExpiry not handled in state AwaitTransportCnf

// Event FileOk not handled in state AwaitTransportCnf

// Event ApplyUpdateCnf not handled in state AwaitTransportCnf

// Event InstallUpdateCnf not handled in state AwaitTransportCnf

// Event ActivateUpdateCnf not handled in state AwaitTransportCnf

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::AwaitTransportCnf::InjectTransportCnf(
    shared_ptr<TransportCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.QueryTransportOk(event))
    {
        mFsm.TracePoint( "QueryTransportOk? (true)" );

        mFsm.mState->Exit();
        mFsm.mInProcedure.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mIdle.Entry();
    }
}

// State AwaitTransportCnf has no deferred events.

// Event FtpSessionCommand deferred in state ActivatingSwPackage

// Event ActivateSoftware deferred in state ActivatingSwPackage

// Event FtpCnf not handled in state ActivatingSwPackage

// Event FtpCompleteInd not handled in state ActivatingSwPackage

// Event TimerExpiry not handled in state ActivatingSwPackage

// Event FileOk not handled in state ActivatingSwPackage

// Event ApplyUpdateCnf not handled in state ActivatingSwPackage

// Event InstallUpdateCnf not handled in state ActivatingSwPackage

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::ActivatingSwPackage::InjectActivateUpdateCnf(
    shared_ptr<ActivateUpdateCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.QueryActivateUpdateSucceeded(event))
    {
        mFsm.TracePoint( "QueryActivateUpdateSucceeded? (true)" );

        mFsm.mState->Exit();
        mFsm.TracePoint( "Action RebootIntoNewSwLoad" );

        mFsm.mInterface.RebootIntoNewSwLoad(event);

        mFsm.mGoInactive.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendDownloadInvalidResponse.Entry();
    }
}

// Event TransportCnf not handled in state ActivatingSwPackage

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
bool FileTransferFsm::ActivatingSwPackage::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
            return true;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
            return true;


        default:
            return false;
    }
}

// Event FtpSessionCommand deferred in state WaitFtpCnf

// Event ActivateSoftware deferred in state WaitFtpCnf

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::WaitFtpCnf::InjectFtpCnf(
    shared_ptr<FtpCnf> event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action StoreFtpCnfId" );

        mFsm.mInterface.StoreFtpCnfId(event);

        mFsm.mWaitFtpCompleteInd.Entry();
    }
}

// Event FtpCompleteInd not handled in state WaitFtpCnf

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::WaitFtpCnf::InjectTimerExpiry(
    void* event
    )
{
    {
        mFsm.TracePoint( "Action SendFtpAbort" );

        mFsm.mInterface.SendFtpAbort(event);

    }
}

// Event FileOk not handled in state WaitFtpCnf

// Event ApplyUpdateCnf not handled in state WaitFtpCnf

// Event InstallUpdateCnf not handled in state WaitFtpCnf

// Event ActivateUpdateCnf not handled in state WaitFtpCnf

// Event TransportCnf not handled in state WaitFtpCnf

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
bool FileTransferFsm::WaitFtpCnf::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
            return true;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
            return true;


        default:
            return false;
    }
}

// Event FtpSessionCommand deferred in state WaitFtpCompleteInd

// Event ActivateSoftware deferred in state WaitFtpCompleteInd

// Event FtpCnf not handled in state WaitFtpCompleteInd

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::WaitFtpCompleteInd::InjectFtpCompleteInd(
    shared_ptr<FtpCompleteInd> event
    )
{
    // Guard condition
    if( mFsm.mInterface.QueryFtpSuccessful(event))
    {
        mFsm.TracePoint( "QueryFtpSuccessful? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action StoreFtpCompleteInd" );

        mFsm.mInterface.StoreFtpCompleteInd(event);

        mFsm.mFileTransferSucceeded.Entry();
    }
    else
    // Guard condition
    if( mFsm.mInterface.QueryFtpAlreadyRetried(event))
    {
        mFsm.TracePoint( "QueryFtpAlreadyRetried? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action StoreFtpCompleteInd" );

        mFsm.mInterface.StoreFtpCompleteInd(event);

        mFsm.mTransferComplete.Entry();
        mFsm.mSendResponse.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::WaitFtpCompleteInd::InjectTimerExpiry(
    void* event
    )
{
    {
        mFsm.TracePoint( "Action SendFtpAbort" );

        mFsm.mInterface.SendFtpAbort(event);

    }
}

// Event FileOk not handled in state WaitFtpCompleteInd

// Event ApplyUpdateCnf not handled in state WaitFtpCompleteInd

// Event InstallUpdateCnf not handled in state WaitFtpCompleteInd

// Event ActivateUpdateCnf not handled in state WaitFtpCompleteInd

// Event TransportCnf not handled in state WaitFtpCompleteInd

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
bool FileTransferFsm::WaitFtpCompleteInd::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
            return true;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
            return true;


        default:
            return false;
    }
}

// Event FtpSessionCommand deferred in state InstallUpdateOnly

// Event ActivateSoftware deferred in state InstallUpdateOnly

// Event FtpCnf not handled in state InstallUpdateOnly

// Event FtpCompleteInd not handled in state InstallUpdateOnly

// Event TimerExpiry not handled in state InstallUpdateOnly

// Event FileOk not handled in state InstallUpdateOnly

// Event ApplyUpdateCnf not handled in state InstallUpdateOnly

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InstallUpdateOnly::InjectInstallUpdateCnf(
    shared_ptr<InstallUpdateCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.QueryInstallUpdateSucceeded(event))
    {
        mFsm.TracePoint( "QueryInstallUpdateSucceeded? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendResponse.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendDownloadInvalidResponse.Entry();
    }
}

// Event ActivateUpdateCnf not handled in state InstallUpdateOnly

// Event TransportCnf not handled in state InstallUpdateOnly

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
bool FileTransferFsm::InstallUpdateOnly::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
            return true;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
            return true;


        default:
            return false;
    }
}

// Event FtpSessionCommand deferred in state InstallUpdateThenActivate

// Event ActivateSoftware deferred in state InstallUpdateThenActivate

// Event FtpCnf not handled in state InstallUpdateThenActivate

// Event FtpCompleteInd not handled in state InstallUpdateThenActivate

// Event TimerExpiry not handled in state InstallUpdateThenActivate

// Event FileOk not handled in state InstallUpdateThenActivate

// Event ApplyUpdateCnf not handled in state InstallUpdateThenActivate

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::InstallUpdateThenActivate::InjectInstallUpdateCnf(
    shared_ptr<InstallUpdateCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.QueryInstallUpdateSucceeded(event))
    {
        mFsm.TracePoint( "QueryInstallUpdateSucceeded? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mActivatingSwPackage.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendDownloadInvalidResponse.Entry();
    }
}

// Event ActivateUpdateCnf not handled in state InstallUpdateThenActivate

// Event TransportCnf not handled in state InstallUpdateThenActivate

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
bool FileTransferFsm::InstallUpdateThenActivate::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case FileTransferFsm::FSM_EVENT_FtpSessionCommand:
            return true;

        case FileTransferFsm::FSM_EVENT_ActivateSoftware:
            return true;


        default:
            return false;
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::TransferSucceededJunction::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mFileTransferSucceeded);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mTransferSucceededJunction;

    // Guard condition
    if( mFsm.mInterface.QueryUpload())
    {
        mFsm.TracePoint( "QueryUpload? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendResponse.Entry();
    }
    else
    // Guard condition
    if( mFsm.mInterface.QuerySwLoad())
    {
        mFsm.TracePoint( "QuerySwLoad? (true)" );

        mFsm.mState->Exit();
        mFsm.mNewSwPackage.Entry();
        mFsm.mSwLoad.Entry();
    }
    else
    // Guard condition
    if( mFsm.mInterface.QuerySwTransfer())
    {
        mFsm.TracePoint( "QuerySwTransfer? (true)" );

        mFsm.mState->Exit();
        mFsm.mNewSwPackage.Entry();
        mFsm.mInstallUpdate.Entry();
        mFsm.mInstallUpdateOnly.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mTransferComplete.Entry();
        mFsm.mSendResponse.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SwLoad::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mNewSwPackage);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mSwLoad;

    {
        mFsm.mState->Exit();
        mFsm.mInstallUpdate.Entry();
        mFsm.mInstallUpdateThenActivate.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mSendResponse;

    // Guard condition
    if( mFsm.mInterface.QueryUpload())
    {
        mFsm.TracePoint( "QueryUpload? (true)" );

        mFsm.mState->Exit();
        mFsm.mSendUploadResponse.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mSendDownloadResponse.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendUploadResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mSendUploadResponse;

    // Guard condition
    if( mFsm.mInterface.QueryFtpSuccessful())
    {
        mFsm.TracePoint( "QueryFtpSuccessful? (true)" );

        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendUploadSuccess" );

        mFsm.mInterface.SendUploadSuccess();

        mFsm.mResponseSent.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendUploadFailed" );

        mFsm.mInterface.SendUploadFailed();

        mFsm.mResponseSent.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendDownloadResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mSendDownloadResponse;

    // Guard condition
    if( mFsm.mInterface.QueryFtpSuccessful())
    {
        mFsm.TracePoint( "QueryFtpSuccessful? (true)" );

        mFsm.mState->Exit();
        mFsm.mSendDownloadSucceededResponse.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mSendDownloadFailedResponse.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendDownloadSucceededResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mInterface.SendDownloadSucceededResponseEntry();

    mFsm.mState = &mFsm.mSendDownloadSucceededResponse;

    {
        mFsm.mState->Exit();
        mFsm.mResponseSent.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendDownloadFailedResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mInterface.SendDownloadFailedResponseEntry();

    mFsm.mState = &mFsm.mSendDownloadFailedResponse;

    {
        mFsm.mState->Exit();
        mFsm.mResponseSent.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::SendDownloadInvalidResponse::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mInterface.SendDownloadInvalidResponseEntry();

    mFsm.mState = &mFsm.mSendDownloadInvalidResponse;

    {
        mFsm.mState->Exit();
        mFsm.mResponseSent.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::ResponseSent::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mTransferComplete);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mResponseSent;

    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mGoInactive.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from Tr069FileTransfer.fsm. Do not edit! ***/
void FileTransferFsm::GoInactive::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mInProcedure);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mGoInactive;

    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mIdle.Entry();
    }
}

} // -namespace-

