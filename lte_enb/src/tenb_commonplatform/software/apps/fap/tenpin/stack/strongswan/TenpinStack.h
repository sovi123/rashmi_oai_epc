///////////////////////////////////////////////////////////////////////////////
//
// TenpinStack.h
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __TenpinStack_h_
#define __TenpinStack_h_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "TenpinStackInterfaces.h"

///////////////////////////////////////////////////////////////////////////////
// Classes
///////////////////////////////////////////////////////////////////////////////

namespace threeway
{

class TenpinStack : public ITenpinStack
{
public:
    // Singleton
    virtual ~TenpinStack() {}
    static TenpinStack& GetInstance();

    // Implement ITenpinStack
    bool Init(void);

    shared_ptr<ITenpinFirewall> GetFirewall (void);
    shared_ptr<ITenpinDns>      GetDns      (void);
    shared_ptr<ITenpinIke>      GetIke      (void);
    shared_ptr<ITenpinHwCrypto> GetHwCrypto (void);

private:
    // Singleton
    TenpinStack() {}
    static shared_ptr<TenpinStack> s_instance;
};

} // namespace threeway

#endif
