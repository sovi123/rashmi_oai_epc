///////////////////////////////////////////////////////////////////////////////
//
// AlarmId.h
//
// Abstract interface class to allow multiple derived classes for particular
// alarm ID domains e.g. Radisys, SNMP, TR069...
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __AlarmId_h_
#define __AlarmId_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <string>

#include <3waytypes.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

namespace threeway
{

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class AlarmId
{
public:

    virtual ~AlarmId() {};

    /**
     * Set the alarm ID as a u32 for when pulling from messages.
     */
    virtual void SetNumericAlarmId(u32 id) = 0;

    /**
     * Get the alarm ID as a u32 for putting in messages.
     */
    virtual u32 GetNumericAlarmId() const = 0;

    /**
     * Get as string for debug/trace.
     */
    virtual std::string ToString() const = 0;

private:

};

}

#endif
