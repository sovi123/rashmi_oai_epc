///////////////////////////////////////////////////////////////////////////////
//
// ValidatorLteAllowedMeasBandwidth.h
//
// AllowedMeasBandwidth validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorLteAllowedMeasBandwidth_h_
#define __ValidatorLteAllowedMeasBandwidth_h_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorString.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorLteAllowedMeasBandwidth : public ValidatorString
{
public:
    ValidatorLteAllowedMeasBandwidth() {};
    virtual ~ValidatorLteAllowedMeasBandwidth() {};

    virtual bool ValidateString(const std::string& value, u32 minLength, u32 maxLength, ValidationFailureDescriptor& failureDescriptor);

};

#endif
