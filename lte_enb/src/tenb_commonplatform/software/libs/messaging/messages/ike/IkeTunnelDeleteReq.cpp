///////////////////////////////////////////////////////////////////////////////
//
// IkeTunnelDeleteReq
//
// Copyright radisys
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/Trace.h>
#include <system/SerialisationUtils.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "IkeTunnelDeleteReq.h"

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

using namespace std;
using namespace threeway;

s32 IkeTunnelDeleteReq::Serialise(u8* data, u32 dataMaxBytes) const
{
    ENTER();

    u8 * start = data;

    if (4 <= dataMaxBytes)
    {
        SerialiseIt(m_id, data);
    }

    RETURN(data - start);
}

bool IkeTunnelDeleteReq::DeSerialise(const u8* data, u32 dataLen)
{
    ENTER();

    bool decode = (4 <= dataLen);

    if (decode)
    {
        DeSerialiseIt(m_id, data);
    }

    RETURN(decode);
}

string IkeTunnelDeleteReq::ToString() const
{
    ENTER();

    ostringstream stream;

    stream << "IkeTunnelDeleteReq:" << " id=" << m_id;

    RETURN(stream.str());
}
