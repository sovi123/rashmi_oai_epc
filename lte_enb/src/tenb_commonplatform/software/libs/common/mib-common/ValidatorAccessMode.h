///////////////////////////////////////////////////////////////////////////////
//
// ValidatorAccessMode.h
//
// AccessMode validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorAccessMode_h_
#define __ValidatorAccessMode_h_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorString.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorAccessMode : public ValidatorString
{
public:
    ValidatorAccessMode() {};
    virtual ~ValidatorAccessMode() {};

    virtual bool ValidateString(const std::string& value, u32 minLength, u32 maxLength, ValidationFailureDescriptor& failureDescriptor);

};

#endif
