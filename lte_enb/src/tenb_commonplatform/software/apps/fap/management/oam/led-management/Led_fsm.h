///////////////////////////////////////////////////////////////////////////////
//
// Led_fsm.h
//
// Autogenerated from led.fsm
//
// See header file for documentation.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Led_fsm_h_
#define __Led_fsm_h_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <list>
#include <deque>
#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Led_fsm_interface.h"

using namespace Led;

namespace Led
{

/*** WARNING: Code AUTO-GENERATED from led.fsm. Do not edit! ***/
class LedFsm
{
public:

    LedFsm(
        LedFsmInterface & interfaceClass,
        bool traceEnabled = false,
        const char * name = "LedFsm"
        );
    virtual ~LedFsm();

    void InjectEventMapLoaded(void* event);
    void InjectEventTemperatureOutOfRange(void* event);
    void InjectEventTemperatureInRange(void* event);
    void InjectEventNoCalibration(void* event);
    void InjectEventSelfTestOk(void* event);
    void InjectEventCannotConnectToServer(void* event);
    void InjectEventConnectedToServer(void* event);
    void InjectEventNotOperationalTimeout(void* event);
    void InjectEventTransmitterEnabled(void* event);
    void InjectEventTransmitterDisabled(void* event);
    std::string ToString() const
    {
        std::string returnedString(mName);

        if(mState)
        {
            returnedString += ".";
            returnedString += mState->mName;
        }

        return returnedString;
    }

    void Rename( const std::string & newName)
    {
        if(mFsmTraceEnabled)
        {
        	TRACE_PRINTF("%s.-: Renamed to %s", mName.c_str(), newName.c_str() );
        }
        mName = newName;
    }

    void SetFsmTraceEnable( bool traceEnable = true ) { mFsmTraceEnabled = traceEnable; }

    void TracePoint( const char * s )
    {
        if(mFsmTraceEnabled)
        {
        	TRACE_PRINTF("%s.%u: %s", mName.c_str(), mEventCounter, s );
        }
    }

private:
    typedef enum EventId_tag
    {
        FSM_EVENT_EventMapLoaded,
        FSM_EVENT_EventTemperatureOutOfRange,
        FSM_EVENT_EventTemperatureInRange,
        FSM_EVENT_EventNoCalibration,
        FSM_EVENT_EventSelfTestOk,
        FSM_EVENT_EventCannotConnectToServer,
        FSM_EVENT_EventConnectedToServer,
        FSM_EVENT_EventNotOperationalTimeout,
        FSM_EVENT_EventTransmitterEnabled,
        FSM_EVENT_EventTransmitterDisabled,
        NUMBER_OF_INJECTABLE_EVENTS
    } EventId;

    typedef enum EventType_tag
    {
        FSM_EVENT_TYPE_void_STAR_,
        NUMBER_OF_EVENT_TYPES
    } EventType;

    class FsmEvent
    {
    public:
        FsmEvent( EventType eventType ) :
            mEventType(eventType) {}
        virtual ~FsmEvent(){}

        EventType mEventType;
    };

    class FsmEvent_void_STAR_ : public FsmEvent
    {
    public:
        FsmEvent_void_STAR_( void* event ) :
            FsmEvent(FSM_EVENT_TYPE_void_STAR_),
            mEvent(event) {}
        ~FsmEvent_void_STAR_() {}
    	void* mEvent;
    };

    void Enqueue( EventId eventId, shared_ptr<FsmEvent> fsmEvent );

    class State;
    typedef std::deque< State * > StateHistory;

    class State
    {
    public:
        State(LedFsm & fsm, const char * name ) :
            mFsm(fsm),
            mName(name){}
        virtual ~State(){}

        virtual void Inject( EventId eventId, shared_ptr<FsmEvent> fsmData ) { RSYS_ASSERT_PRINTF(false,"Cannot inject in state %s.", mName.c_str()); }
        virtual bool RunToCompletion() { RSYS_ASSERT_PRINTF(false,"RunToCompletion failure in state %s.", mName.c_str()); return false; };
        virtual bool DeferEvent( EventId ) const { RSYS_ASSERT_PRINTF(false,"Cannot defer in state %s.", mName.c_str()); return false; }

        virtual void Entry()
        {
            RSYS_ASSERT( mFsm.mState == GetSuperstate() );

            UpdateHistoryUponEntry();

            if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (entry) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

            InterfaceEntryMethod();

            mFsm.mState = this;
        }

        virtual void Exit()
        {
            RSYS_ASSERT( mFsm.mState == this);

            UpdateHistoryUponExit();

            if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s (exit) ", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

            InterfaceExitMethod();

            mFsm.mState =  GetSuperstate();
        }

        LedFsm& mFsm;
        std::string mName;
        virtual State * GetSuperstate() const { return NULL; }
        virtual void  InterfaceEntryMethod() {}
        virtual void  InterfaceExitMethod() {}
        virtual void  UpdateHistoryUponExit() { mFsm.mCurrentStateTransitionExitsList.push_front( mFsm.mState ); }
        virtual void  UpdateHistoryUponEntry() { mFsm.mCurrentStateTransitionExitsList.clear(); }
    };

    class SimpleState : public State
    {
    public:
        SimpleState(LedFsm & fsm, const char * name) :
            State(fsm, name){}
        virtual ~SimpleState(){}

        void Inject( EventId eventId, shared_ptr<FsmEvent> fsmData );
        virtual bool RunToCompletion() { return true; }

        virtual bool DeferEvent( EventId ) const { return false; }
        virtual void InjectEventMapLoaded( void* eventData) { EventConsumed(FSM_EVENT_EventMapLoaded); }
        virtual void InjectEventTemperatureOutOfRange( void* eventData) { EventConsumed(FSM_EVENT_EventTemperatureOutOfRange); }
        virtual void InjectEventTemperatureInRange( void* eventData) { EventConsumed(FSM_EVENT_EventTemperatureInRange); }
        virtual void InjectEventNoCalibration( void* eventData) { EventConsumed(FSM_EVENT_EventNoCalibration); }
        virtual void InjectEventSelfTestOk( void* eventData) { EventConsumed(FSM_EVENT_EventSelfTestOk); }
        virtual void InjectEventCannotConnectToServer( void* eventData) { EventConsumed(FSM_EVENT_EventCannotConnectToServer); }
        virtual void InjectEventConnectedToServer( void* eventData) { EventConsumed(FSM_EVENT_EventConnectedToServer); }
        virtual void InjectEventNotOperationalTimeout( void* eventData) { EventConsumed(FSM_EVENT_EventNotOperationalTimeout); }
        virtual void InjectEventTransmitterEnabled( void* eventData) { EventConsumed(FSM_EVENT_EventTransmitterEnabled); }
        virtual void InjectEventTransmitterDisabled( void* eventData) { EventConsumed(FSM_EVENT_EventTransmitterDisabled); }

    private:
        void EventConsumed( EventId queuedEventId )
        {
            if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s consumed %s", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str(), mEventName[queuedEventId] ); }
        }
    };

    class InitialState : public SimpleState
    {
    public:
        InitialState(LedFsm & fsm) :
            SimpleState(fsm, "InitialState") {}
        virtual ~InitialState(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.InitialStateEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventMapLoaded( void* eventData);
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
    };

    class WrongTemperature : public SimpleState
    {
    public:
        WrongTemperature(LedFsm & fsm) :
            SimpleState(fsm, "WrongTemperature") {}
        virtual ~WrongTemperature(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.WrongTemperatureEntry();}
        bool DeferEvent( EventId ) const ;
        virtual void InjectEventTemperatureInRange( void* eventData);
    };

    class FapError : public SimpleState
    {
    public:
        FapError(LedFsm & fsm) :
            SimpleState(fsm, "FapError") {}
        virtual ~FapError(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.FapErrorEntry();}
    };

    class PowerOnSelfTest : public SimpleState
    {
    public:
        PowerOnSelfTest(LedFsm & fsm) :
            SimpleState(fsm, "PowerOnSelfTest") {}
        virtual ~PowerOnSelfTest(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.PowerOnSelfTestEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventNoCalibration( void* eventData);
        virtual void InjectEventSelfTestOk( void* eventData);
    };

    class ConnectToServer : public SimpleState
    {
    public:
        ConnectToServer(LedFsm & fsm) :
            SimpleState(fsm, "ConnectToServer") {}
        virtual ~ConnectToServer(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.ConnectToServerEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventCannotConnectToServer( void* eventData);
        virtual void InjectEventConnectedToServer( void* eventData);
    };

    class NoConnectionToServer : public SimpleState
    {
    public:
        NoConnectionToServer(LedFsm & fsm) :
            SimpleState(fsm, "NoConnectionToServer") {}
        virtual ~NoConnectionToServer(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.NoConnectionToServerEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventConnectedToServer( void* eventData);
    };

    class NotOperational : public SimpleState
    {
    public:
        NotOperational(LedFsm & fsm) :
            SimpleState(fsm, "NotOperational") {}
        virtual ~NotOperational(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.NotOperationalEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventNotOperationalTimeout( void* eventData);
        virtual void InjectEventTransmitterEnabled( void* eventData);
    };

    class OperationalError : public SimpleState
    {
    public:
        OperationalError(LedFsm & fsm) :
            SimpleState(fsm, "OperationalError") {}
        virtual ~OperationalError(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.OperationalErrorEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventTransmitterEnabled( void* eventData);
    };

    class Operational : public SimpleState
    {
    public:
        Operational(LedFsm & fsm) :
            SimpleState(fsm, "Operational") {}
        virtual ~Operational(){}

        void InterfaceEntryMethod( void ) { mFsm.mInterface.OperationalEntry();}
        bool DeferEvent( EventId ) const ;
        State * GetSuperstate() const { return &mFsm.mTemperatureOK; }
        virtual void InjectEventTemperatureOutOfRange( void* eventData);
        virtual void InjectEventTransmitterDisabled( void* eventData);
    };

    class Superstate : public State
    {
    public:
        Superstate(LedFsm & fsm, const char * name) :
            State(fsm, name)
        { }
        virtual ~Superstate()
        { }
    };

    class SuperstateWithInitialState : public Superstate
    {
    public:
        SuperstateWithInitialState(LedFsm & fsm, const char * name) :
            Superstate(fsm, name) {}
        virtual ~SuperstateWithInitialState() {}

        virtual bool RunToCompletion() = 0;
    };

    class SuperstateWithHistory : public SuperstateWithInitialState
    {
    public:
        SuperstateWithHistory(LedFsm & fsm, const char * name) :
            SuperstateWithInitialState(fsm, name) {}
        virtual ~SuperstateWithHistory()
        {
            mHistory.clear();
        }

        virtual bool RunToCompletion()
        {
            RSYS_ASSERT(!mHistory.empty());

            if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: %s RunToCompletion...", mFsm.mName.c_str(), mFsm.mEventCounter, mName.c_str() ); }

            StateHistory::iterator historicState = mHistory.begin();

            while(historicState != mHistory.end())
            {
                State    * subState = *historicState;

                RSYS_ASSERT(subState);

                subState->Entry();

                ++historicState;
            }

            return false;
        }

        virtual void Exit()
        {
            RSYS_ASSERT(!mHistory.empty());

            SuperstateWithInitialState::Exit();
        }

        StateHistory mHistory;
    };

    class SuperstateWithShallowHistory : public SuperstateWithHistory
    {
    public:
        SuperstateWithShallowHistory(LedFsm & fsm, const char * name) :
            SuperstateWithHistory(fsm, name)
        { }
        virtual ~SuperstateWithShallowHistory()
        { }

        virtual void Exit()
        {
            RSYS_ASSERT( mFsm.mState == this);

            StateHistory::iterator historicState = mFsm.mCurrentStateTransitionExitsList.begin();
            RSYS_ASSERT(historicState != mFsm.mCurrentStateTransitionExitsList.end());
            State * subState = *historicState;
            RSYS_ASSERT(subState);
            if(mFsm.mFsmTraceEnabled) { TRACE_PRINTF("%s.%u: H=%s", mFsm.mName.c_str(), mFsm.mEventCounter,subState->mName.c_str() ); }

            // Shallow History
            mHistory.clear();
            mHistory.push_front( subState );

            SuperstateWithHistory::Exit();
        }
    };

    class TemperatureOK : public SuperstateWithShallowHistory
    {
    public:
        TemperatureOK(LedFsm & fsm) :
            SuperstateWithShallowHistory(fsm, "TemperatureOK") {}
        virtual ~TemperatureOK(){}


    private:
        bool RunToCompletion( void )
        {
            if(mHistory.empty())
            {
            {
                mFsm.mInitialState.Entry();
            }
            }
            else
            {
                return SuperstateWithShallowHistory::RunToCompletion();
            }

            return false;
        }
    };

    class QueuedFsmEvent
    {
    public:
        QueuedFsmEvent( EventId eventId, shared_ptr<FsmEvent> fsmEvent) :
            mId(eventId),
            mFsmEvent(fsmEvent){}
        ~QueuedFsmEvent(){}

        EventId mId;
        shared_ptr<FsmEvent> mFsmEvent;
    };

    LedFsmInterface & mInterface;
    bool mFsmTraceEnabled;
    std::string mName;
    State * mState;
    TemperatureOK mTemperatureOK;
    InitialState mInitialState;
    WrongTemperature mWrongTemperature;
    FapError mFapError;
    PowerOnSelfTest mPowerOnSelfTest;
    ConnectToServer mConnectToServer;
    NoConnectionToServer mNoConnectionToServer;
    NotOperational mNotOperational;
    OperationalError mOperationalError;
    Operational mOperational;
    std::list< shared_ptr<QueuedFsmEvent> > mfsmEventQueue;
    bool mFsmInjectInProgress;
    unsigned mEventCounter;
    StateHistory mCurrentStateTransitionExitsList;
    static const char * mEventName[NUMBER_OF_INJECTABLE_EVENTS];

};

} // -namespace-

#endif // __Led_fsm_interface_h_

