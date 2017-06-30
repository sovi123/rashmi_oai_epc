///////////////////////////////////////////////////////////////////////////////
//
// ValidatorDrxEnbDis.h
//
// A validator for DrxQci
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorNoOfCellBsdOnCaFlag_h_
#define __ValidatorNoOfCellBsdOnCaFlag_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorU32.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorNoOfCellBsdOnCaFlag: public ValidatorU32
{
public:

    ValidatorNoOfCellBsdOnCaFlag() {};
    virtual ~ValidatorNoOfCellBsdOnCaFlag() {};

    virtual bool ValidateU32(MibDN Dn, u32 value, u32 min, u32 max, ValidationFailureDescriptor& failureDescriptor);
protected:

private:
   u32 isCaEnable;
  
};

#endif
