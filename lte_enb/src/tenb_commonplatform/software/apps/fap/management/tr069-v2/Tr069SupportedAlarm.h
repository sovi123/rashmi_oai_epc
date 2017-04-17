///////////////////////////////////////////////////////////////////////////////
//
// Tr069SupportedAlarm
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069SupportedAlarm_h_
#define __Tr069SupportedAlarm_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/AlarmEvent.h>
#include <system/AlarmEventType.h>
#include <system/AlarmPerceivedSeverity.h>
#include <system/AlarmReportingMechanism.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "Tr196Alarm.h"

using namespace std;

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

typedef struct SupportedAlarm_tag
{
    AlarmEventType          eventType;
    const char *            probableCause;
    const char *            specificProblem;
    AlarmPerceivedSeverity  perceivedSeverity;
    AlarmReportingMechanism reportingMechanism;
} SupportedAlarm;

typedef struct MappedSupportedAlarm_tag
{
    FapAlarmId::Id     	    alarmId;
    SupportedAlarm          alarm;
} MappedSupportedAlarm;


}

#endif