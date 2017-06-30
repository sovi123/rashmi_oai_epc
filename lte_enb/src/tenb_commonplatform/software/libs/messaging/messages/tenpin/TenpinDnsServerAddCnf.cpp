///////////////////////////////////////////////////////////////////////////////
//
// TenpinDnsServerAddCnf.cpp
//
// See header file for documentation.
//
// Copyright radisys Limited
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

#include "TenpinDnsServerAddCnf.h"

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

s32 TenpinDnsServerAddCnf::Serialise(u8* data, u32 dataMaxBytes) const
{
    return 0;
}

bool TenpinDnsServerAddCnf::DeSerialise(const u8* data, u32 dataLen)
{
    return true;
}

std::string TenpinDnsServerAddCnf::ToString() const
{
    ostringstream stream;

    stream << "TenpinDnsServerAddCnf";

    return stream.str();
}
