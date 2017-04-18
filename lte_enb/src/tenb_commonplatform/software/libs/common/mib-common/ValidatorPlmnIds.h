///////////////////////////////////////////////////////////////////////////////
//
// ValidatorPlmnIds.h
//
// PLMN ID value validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorPlmnIds_h_
#define __ValidatorPlmnIds_h_

#include <vector>
#include <system/Regex.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorStringArray.h"


///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorPlmnIds : public ValidatorStringArray
{
public:
    ValidatorPlmnIds() {};
    virtual ~ValidatorPlmnIds() {};

    virtual bool ValidateStringArray(const std::vector<std::string>& value, u32 minLength, u32 maxLength, s32 minValue, s32 maxValue, u32 maxInstances, ValidationFailureDescriptor& failureDescriptor);

};

#endif
