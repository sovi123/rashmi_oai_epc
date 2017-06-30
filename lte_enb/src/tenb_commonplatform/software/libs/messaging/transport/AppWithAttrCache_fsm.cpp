///////////////////////////////////////////////////////////////////////////////
//
//AppWithAttrCache_fsm.cpp
//
// Autogenerated from AppWithAttrCache.fsm
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

#include "AppWithAttrCache_fsm.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////


/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
AppWithAttrCacheFsm::AppWithAttrCacheFsm(
    AppWithAttrCacheFsmInterface & interfaceClass,
    bool traceEnabled,
    const char * name 
    ) :
    mInterface(interfaceClass),
    mFsmTraceEnabled(traceEnabled),
    mName(name),
    mState(NULL),
    mAll(*this ),
    mNotRegistered(*this ),
    mRegistered(*this ),
    mNotSubscribed(*this ),
    mSubscribed(*this ),
    mIdle(*this ),
    mRegistering(*this ),
    mCheckSubscriptions(*this ),
    mSubscribing(*this ),
    mInformingReady(*this ),
    mStarted(*this ),
    mfsmEventQueue(),
    mFsmInjectInProgress(false),
    mEventCounter(0)
{
    // Initial State
    mAll.Entry();
    mNotRegistered.Entry();
    mIdle.Entry();

    if(NULL != mState)
    {
       while( !mState->RunToCompletion() )
       {
          continue;
       }
    }
}

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
AppWithAttrCacheFsm::~AppWithAttrCacheFsm()
{
    RSYS_ASSERT_PRINTF(!mFsmInjectInProgress, "AppWithAttrCacheFsm deleted while event-inject in progress.");

    mfsmEventQueue.clear();
    mCurrentStateTransitionExitsList.clear();
}

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectStart(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_Start, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectRegisterEntityCnf(boost::shared_ptr<RegisterEntityCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_boost_COLON__COLON_shared_ptr_LT_RegisterEntityCnf_GT_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_RegisterEntityCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectMibSubscribeAttributesCnf(boost::shared_ptr<MibSubscribeAttributesCnf> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_boost_COLON__COLON_shared_ptr_LT_MibSubscribeAttributesCnf_GT_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_MibSubscribeAttributesCnf, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectRequestStartRsp(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_RequestStartRsp, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectTimerExpiryRegistration(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_TimerExpiryRegistration, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectTimerExpirySubscriptions(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_TimerExpirySubscriptions, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InjectTimerExpiryReady(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( AppWithAttrCacheFsm::FSM_EVENT_TimerExpiryReady, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Enqueue( EventId eventId, shared_ptr<FsmEvent> fsmEvent )
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

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
const char * AppWithAttrCacheFsm::mEventName[NUMBER_OF_INJECTABLE_EVENTS] =
{
    "Start",
    "RegisterEntityCnf",
    "MibSubscribeAttributesCnf",
    "RequestStartRsp",
    "TimerExpiryRegistration",
    "TimerExpirySubscriptions",
    "TimerExpiryReady",
};

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::SimpleState::Inject(
    EventId eventId,
    shared_ptr<FsmEvent> fsmEvent
    )
{
    RSYS_ASSERT(eventId < NUMBER_OF_INJECTABLE_EVENTS);

    switch(eventId)
    {
        case AppWithAttrCacheFsm::FSM_EVENT_Start:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectStart(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_RegisterEntityCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_boost_COLON__COLON_shared_ptr_LT_RegisterEntityCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_boost_COLON__COLON_shared_ptr_LT_RegisterEntityCnf_GT_> event = dynamic_pointer_cast<FsmEvent_boost_COLON__COLON_shared_ptr_LT_RegisterEntityCnf_GT_>(fsmEvent);
            InjectRegisterEntityCnf(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_MibSubscribeAttributesCnf:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_boost_COLON__COLON_shared_ptr_LT_MibSubscribeAttributesCnf_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_boost_COLON__COLON_shared_ptr_LT_MibSubscribeAttributesCnf_GT_> event = dynamic_pointer_cast<FsmEvent_boost_COLON__COLON_shared_ptr_LT_MibSubscribeAttributesCnf_GT_>(fsmEvent);
            InjectMibSubscribeAttributesCnf(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_RequestStartRsp:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectRequestStartRsp(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_TimerExpiryRegistration:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectTimerExpiryRegistration(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_TimerExpirySubscriptions:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectTimerExpirySubscriptions(event->mEvent);
        }
        break;

        case AppWithAttrCacheFsm::FSM_EVENT_TimerExpiryReady:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectTimerExpiryReady(event->mEvent);
        }
        break;

        default:
            RSYS_ASSERT(false);
            break;
    }
}

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Idle::InjectStart(
    void* event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendEntityRegisterReqs" );

        mFsm.mInterface.SendEntityRegisterReqs(event);

        mFsm.mRegistering.Entry();
    }
}

// Event RegisterEntityCnf not handled in state Idle

// Event MibSubscribeAttributesCnf not handled in state Idle

// Event RequestStartRsp not handled in state Idle

// Event TimerExpiryRegistration not handled in state Idle

// Event TimerExpirySubscriptions not handled in state Idle

// Event TimerExpiryReady not handled in state Idle

// State Idle has no deferred events.

// Event Start not handled in state Registering

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Registering::InjectRegisterEntityCnf(
    boost::shared_ptr<RegisterEntityCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.AllEntitiesRegistered(event))
    {
        mFsm.TracePoint( "AllEntitiesRegistered? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mRegistered.Entry();
        mFsm.mNotSubscribed.Entry();
        mFsm.mCheckSubscriptions.Entry();
    }
    else
    {
        SimpleState::InjectRegisterEntityCnf(event);
    }
}

// Event MibSubscribeAttributesCnf not handled in state Registering

// Event RequestStartRsp not handled in state Registering

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Registering::InjectTimerExpiryRegistration(
    void* event
    )
{
    {
        mFsm.TracePoint( "Action SendOutstandingEntityRegisterReqs" );

        mFsm.mInterface.SendOutstandingEntityRegisterReqs(event);

    }
}

// Event TimerExpirySubscriptions not handled in state Registering

// Event TimerExpiryReady not handled in state Registering

// State Registering has no deferred events.

// Event Start not handled in state Subscribing

// Event RegisterEntityCnf not handled in state Subscribing

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Subscribing::InjectMibSubscribeAttributesCnf(
    boost::shared_ptr<MibSubscribeAttributesCnf> event
    )
{
    // Guard condition
    if( mFsm.mInterface.AllSubscriptionsReceived(event))
    {
        mFsm.TracePoint( "AllSubscriptionsReceived? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendReadyToStart" );

        mFsm.mInterface.SendReadyToStart(event);

        mFsm.mSubscribed.Entry();
        mFsm.mInformingReady.Entry();
    }
    else
    {
        SimpleState::InjectMibSubscribeAttributesCnf(event);
    }
}

// Event RequestStartRsp not handled in state Subscribing

// Event TimerExpiryRegistration not handled in state Subscribing

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::Subscribing::InjectTimerExpirySubscriptions(
    void* event
    )
{
    {
        mFsm.TracePoint( "Action SendOutstandingSubscribeAttributesReqs" );

        mFsm.mInterface.SendOutstandingSubscribeAttributesReqs(event);

    }
}

// Event TimerExpiryReady not handled in state Subscribing

// State Subscribing has no deferred events.

// Event Start not handled in state InformingReady

// Event RegisterEntityCnf not handled in state InformingReady

// Event MibSubscribeAttributesCnf not handled in state InformingReady

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InformingReady::InjectRequestStartRsp(
    void* event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.mStarted.Entry();
    }
}

// Event TimerExpiryRegistration not handled in state InformingReady

// Event TimerExpirySubscriptions not handled in state InformingReady

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::InformingReady::InjectTimerExpiryReady(
    void* event
    )
{
    {
        mFsm.TracePoint( "Action SendReadyToStart" );

        mFsm.mInterface.SendReadyToStart(event);

    }
}

// State InformingReady has no deferred events.

// Event Start not handled in state Started

// Event RegisterEntityCnf not handled in state Started

// Event MibSubscribeAttributesCnf not handled in state Started

// Event RequestStartRsp not handled in state Started

// Event TimerExpiryRegistration not handled in state Started

// Event TimerExpirySubscriptions not handled in state Started

// Event TimerExpiryReady not handled in state Started

// State Started has no deferred events.

/*** WARNING: Code AUTO-GENERATED from AppWithAttrCache.fsm. Do not edit! ***/
void AppWithAttrCacheFsm::CheckSubscriptions::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mNotSubscribed);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mCheckSubscriptions;

    // Guard condition
    if( mFsm.mInterface.HaveSubscriptions())
    {
        mFsm.TracePoint( "HaveSubscriptions? (true)" );

        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendSubscribeAttributesReqs" );

        mFsm.mInterface.SendSubscribeAttributesReqs();

        mFsm.mSubscribing.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendReadyToStart" );

        mFsm.mInterface.SendReadyToStart();

        mFsm.mSubscribed.Entry();
        mFsm.mInformingReady.Entry();
    }
}


