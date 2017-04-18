///////////////////////////////////////////////////////////////////////////////
//
// RevertUpdateReq.cpp
//
// See header file for documentation.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <sstream>
#include <system/Trace.h>
#include <system/SerialisationUtils.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "RevertUpdateReq.h"

using namespace std;
using namespace threeway;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////


s32 RevertUpdateReq::Serialise(u8* data, u32 dataMaxBytes) const
{
    ENTER();


    // Serialise all the members.
    u8* serialisedData = data;

    SerialiseIt(m_dummyPayload, serialisedData);

    RETURN(serialisedData - data);
}

bool RevertUpdateReq::DeSerialise(const u8* data, u32 dataLen)
{
    ENTER();

    DeSerialiseIt(m_dummyPayload, data);

    RETURN(true);
}

std::string RevertUpdateReq::ToString() const
{
    ENTER();

    ostringstream stream;

    stream << "RevertUpdate " ;

    RETURN(stream.str());
}
