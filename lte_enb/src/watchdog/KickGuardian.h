///////////////////////////////////////////////////////////////////////////////
//
// Guardian.h
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __KickGuardian_h_
#define __KickGuardian_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <time.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "3waytypes.h"
#include "Guardian.h"

///////////////////////////////////////////////////////////////////////////////
// Classes
///////////////////////////////////////////////////////////////////////////////

class KickGuardian : public Guardian
{
public:
    KickGuardian(u32 id, u16 soft, u16 hard);
    ~KickGuardian();

    void Kick();

    bool IsGood();

    std::string ToString();

    static bool hasExpired(time_t now, time_t start, time_t end);

private:
    u32    m_id;
    time_t m_softDelta;
    time_t m_hardDelta;
    time_t m_lastKick;
};

#endif
