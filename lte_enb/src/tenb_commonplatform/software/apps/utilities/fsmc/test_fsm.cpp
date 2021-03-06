///////////////////////////////////////////////////////////////////////////////
//
//test_fsm.cpp
//
// Autogenerated from test.fsm
//
// See header file for documentation.
//
// Copyright Radisys Limited
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

#include "test_fsm.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////

using namespace testing;

namespace testing
{

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
TestFsm::TestFsm(
    TestFsmInterface & interfaceClass,
    bool traceEnabled,
    const char * name 
    ) :
    mInterface(interfaceClass),
    mFsmTraceEnabled(traceEnabled),
    mName(name),
    mState(NULL),
    mActive(*this ),
    mInactive(*this ),
    mStarting(*this ),
    mRunning(*this ),
    mStopping(*this ),
    mGoInactive(*this ),
    mfsmEventQueue(),
    mFsmInjectInProgress(false),
    mEventCounter(0)
{
    // Initial State
    mInactive.Entry();

    while( !mState->RunToCompletion() )
    {
        continue;
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
TestFsm::~TestFsm()
{
    RSYS_ASSERT_PRINTF(!mFsmInjectInProgress, "TestFsm deleted while event-inject in progress.");

    mfsmEventQueue.clear();
    mCurrentStateTransitionExitsList.clear();
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::InjectAlpha(shared_ptr<threeway::Queueable> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_(event));
    Enqueue( TestFsm::FSM_EVENT_Alpha, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::InjectBeta(shared_ptr<threeway::Queueable> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_(event));
    Enqueue( TestFsm::FSM_EVENT_Beta, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::InjectGamma(void* event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_void_STAR_(event));
    Enqueue( TestFsm::FSM_EVENT_Gamma, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::InjectDelta(shared_ptr<threeway::Queueable> event)
{
    shared_ptr<FsmEvent> fsmEvent(new FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_(event));
    Enqueue( TestFsm::FSM_EVENT_Delta, fsmEvent);
}
/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Enqueue( EventId eventId, shared_ptr<FsmEvent> fsmEvent )
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

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
const char * TestFsm::mEventName[NUMBER_OF_INJECTABLE_EVENTS] =
{
    "Alpha",
    "Beta",
    "Gamma",
    "Delta",
};

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::SimpleState::Inject(
    EventId eventId,
    shared_ptr<FsmEvent> fsmEvent
    )
{
    RSYS_ASSERT(eventId < NUMBER_OF_INJECTABLE_EVENTS);

    switch(eventId)
    {
        case TestFsm::FSM_EVENT_Alpha:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_>(fsmEvent);
            InjectAlpha(event->mEvent);
        }
        break;

        case TestFsm::FSM_EVENT_Beta:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_>(fsmEvent);
            InjectBeta(event->mEvent);
        }
        break;

        case TestFsm::FSM_EVENT_Gamma:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_void_STAR_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_void_STAR_> event = dynamic_pointer_cast<FsmEvent_void_STAR_>(fsmEvent);
            InjectGamma(event->mEvent);
        }
        break;

        case TestFsm::FSM_EVENT_Delta:
        {
            RSYS_ASSERT(FSM_EVENT_TYPE_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_ == fsmEvent->mEventType);
            shared_ptr<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_> event = dynamic_pointer_cast<FsmEvent_shared_ptr_LT_threeway_COLON__COLON_Queueable_GT_>(fsmEvent);
            InjectDelta(event->mEvent);
        }
        break;

        default:
            RSYS_ASSERT(false);
            break;
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Inactive::InjectAlpha(
    shared_ptr<threeway::Queueable> event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.mActive.Entry();
        mFsm.mStarting.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Inactive::InjectBeta(
    shared_ptr<threeway::Queueable> event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Inactive::InjectGamma(
    void* event
    )
{
    // Guard condition
    if( mFsm.mInterface.GammaMessageCorrupt(event))
    {
        mFsm.TracePoint( "GammaMessageCorrupt? (true)" );

        mFsm.TracePoint( "Action Ignore" );

        mFsm.mInterface.Ignore(event);

    }
    else
    // Guard condition
    if( mFsm.mInterface.GammaMessageValidButInconsistant(event))
    {
        mFsm.TracePoint( "GammaMessageValidButInconsistant? (true)" );

        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendGammaNack" );

        mFsm.mInterface.SendGammaNack(event);

        mFsm.mInactive.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendGammaAck" );

        mFsm.mInterface.SendGammaAck(event);

        mFsm.mActive.Entry();
        mFsm.mStarting.Entry();
    }
}

// Event Delta deferred in state Inactive

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
bool TestFsm::Inactive::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case TestFsm::FSM_EVENT_Delta:
            return true;


        default:
            return false;
    }
}

// Event Alpha deferred in state Starting

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Starting::InjectBeta(
    shared_ptr<threeway::Queueable> event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.mRunning.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Starting::InjectGamma(
    void* event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Starting::InjectDelta(
    shared_ptr<threeway::Queueable> event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
bool TestFsm::Starting::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case TestFsm::FSM_EVENT_Alpha:
            return true;


        default:
            return false;
    }
}

// Event Alpha deferred in state Running

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Running::InjectBeta(
    shared_ptr<threeway::Queueable> event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Running::InjectGamma(
    void* event
    )
{
    // Guard condition
    if( mFsm.mInterface.GammaMessageCorrupt(event))
    {
        mFsm.TracePoint( "GammaMessageCorrupt? (true)" );

        mFsm.TracePoint( "Action Ignore" );

        mFsm.mInterface.Ignore(event);

    }
    else
    {
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendGammaAck" );

        mFsm.mInterface.SendGammaAck(event);

        mFsm.mStopping.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Running::InjectDelta(
    shared_ptr<threeway::Queueable> event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
bool TestFsm::Running::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case TestFsm::FSM_EVENT_Alpha:
            return true;


        default:
            return false;
    }
}

// Event Alpha deferred in state Stopping

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Stopping::InjectBeta(
    shared_ptr<threeway::Queueable> event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Stopping::InjectGamma(
    void* event
    )
{
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::Stopping::InjectDelta(
    shared_ptr<threeway::Queueable> event
    )
{
    {
        mFsm.mState->Exit();
        mFsm.mGoInactive.Entry();
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
bool TestFsm::Stopping::DeferEvent( EventId eventId ) const
{
    switch( eventId )
    {
        case TestFsm::FSM_EVENT_Alpha:
            return true;


        default:
            return false;
    }
}

/*** WARNING: Code AUTO-GENERATED from test.fsm. Do not edit! ***/
void TestFsm::GoInactive::Entry( )
{
    RSYS_ASSERT(mFsm.mState == &mFsm.mActive);

    if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

    mFsm.mState = &mFsm.mGoInactive;

    // Guard condition
    if( mFsm.mInterface.Precondition2())
    {
        mFsm.TracePoint( "Precondition2? (true)" );

        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.TracePoint( "Action SendGammaAck" );

        mFsm.mInterface.SendGammaAck();

        mFsm.mInactive.Entry();
    }
    else
    {
        mFsm.mState->Exit();
        mFsm.mState->Exit();
        mFsm.mInactive.Entry();
    }
}

} // -namespace-

