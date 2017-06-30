///////////////////////////////////////////////////////////////////////////////
//
// ValidatorTEvaluation.h
//
// A validator for TEvaluation and THystNormal.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorTEvaluation_h_
#define __ValidatorTEvaluation_h_

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

class ValidatorTEvaluation : public ValidatorU32
{
public:

    ValidatorTEvaluation() {};
    virtual ~ValidatorTEvaluation() {};

    virtual bool ValidateU32(u32 value, u32 min, u32 max, ValidationFailureDescriptor& failureDescriptor);

protected:

private:

};

#endif
