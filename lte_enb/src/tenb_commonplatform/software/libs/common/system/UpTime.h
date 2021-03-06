///////////////////////////////////////////////////////////////////////////////
//
// UpTime.h
//
// Defines the UpTime Class.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __threeway_UpTime_h_
#define __threeway_UpTime_h_

///////////////////////////////////////////////////////////////////////////////
// Includes
///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <system/Thread.h>

namespace threeway
{

///////////////////////////////////////////////////////////////////////////////
// Forward Declarations
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Typedefs
///////////////////////////////////////////////////////////////////////////////
typedef u64 uptime_t;

///////////////////////////////////////////////////////////////////////////////
// Classes
///////////////////////////////////////////////////////////////////////////////

class UpTime
{
public:
    UpTime( bool singleThreaded = false );
    ~UpTime();

    uptime_t GetMillisecs() const;

private:
    /* Note, the following is used to protect reads to /proc/uptime
     * from multiple threads.
     */
    Mutex*  m_uptimeFpReadMutex;
    inline void ReadUpTimeFile( unsigned & seconds, unsigned & hundredths ) const;

    void SetCloExec(const int fd) const;

    // File/handle for /proc/uptime.
    static const char m_fileName[];
    mutable FILE*  m_uptimeFp;
};


}

#endif

