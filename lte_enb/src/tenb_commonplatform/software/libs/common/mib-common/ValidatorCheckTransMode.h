///////////////////////////////////////////////////////////////////////////////
//
// ValidatorCheckTransMode.h
//
//  checking the preferred transmission mode validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorCheckTransMode_h_
#define __ValidatorCheckTransMode_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorString.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorCheckTransMode : public ValidatorString
{
public:
    ValidatorCheckTransMode() {};
    virtual ~ValidatorCheckTransMode() {};

    virtual bool ValidateString(const std::string& value, u32 minLength, u32 maxLength, ValidationFailureDescriptor& failureDescriptor);

};

#endif
