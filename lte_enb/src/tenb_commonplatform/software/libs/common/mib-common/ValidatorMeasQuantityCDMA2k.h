///////////////////////////////////////////////////////////////////////////////
//
// ValidatorMeasQuantityCDMA2k.h
//
// MeasQuantity validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorMeasQuantityCDMA2k_h_
#define __ValidatorMeasQuantityCDMA2k_h_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorString.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorMeasQuantityCDMA2k : public ValidatorString
{
public:
    ValidatorMeasQuantityCDMA2k() {};
    virtual ~ValidatorMeasQuantityCDMA2k() {};

    virtual bool ValidateString(const std::string& value, u32 minLength, u32 maxLength, ValidationFailureDescriptor& failureDescriptor);

};

#endif

