///////////////////////////////////////////////////////////////////////////////
//
// ValidatorResponseWindowSize.h
//
// A validator for ResponseWindowSize.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorResponseWindowSize_h_
#define __ValidatorResponseWindowSize_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorStringArray.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorResponseWindowSize : public ValidatorStringArray, ValidatorString
{
public:

    ValidatorResponseWindowSize() {};
    virtual ~ValidatorResponseWindowSize() {};

    virtual bool ValidateStringArray(const std::vector<std::string>& value, u32 minLength, u32 maxLength, s32 minValue, s32 maxValue, u32 maxInstances, ValidationFailureDescriptor& failureDescriptor);
};

#endif