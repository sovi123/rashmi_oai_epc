///////////////////////////////////////////////////////////////////////////////
//
// TenpinStack.cpp
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "TenpinStack.h"
#include "StrongswanFirewall.h"
#include "TenpinResolvConfDns.h"
#include "StrongswanIke.h"
#include "StrongswanHwCrypto.h"

using namespace threeway;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

shared_ptr<TenpinStack> TenpinStack::s_instance;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

TenpinStack& TenpinStack::GetInstance()
{
    if (NULL == s_instance)
    {
        s_instance.reset(new TenpinStack());
    }

    return (*s_instance);
}

bool TenpinStack::Init(
    void
)
{
    return true;
}

shared_ptr<ITenpinFirewall> TenpinStack::GetFirewall()
{
    return StrongswanFirewall::GetInstance();
}

shared_ptr<ITenpinDns> TenpinStack::GetDns()
{
    return TenpinResolvConfDns::GetInstance();
}

shared_ptr<ITenpinIke> TenpinStack::GetIke()
{
    return StrongswanIke::GetInstance();
}

shared_ptr<ITenpinHwCrypto> TenpinStack::GetHwCrypto()
{
    return StrongswanHwCrypto::GetInstance();
}
