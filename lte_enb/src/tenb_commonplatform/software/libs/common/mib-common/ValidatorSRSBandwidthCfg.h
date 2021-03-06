///////////////////////////////////////////////////////////////////////////////
//
// ValidatorSRSBandwidthCfg.h
//
// SRSBandwidthCfg validator.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ValidatorSRSBandwidthCfg_h_
#define __ValidatorSRSBandwidthCfg_h_

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorStringArray.h"

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class ValidatorSRSBandwidthCfg : public ValidatorStringArray, ValidatorString
{
public:
    ValidatorSRSBandwidthCfg() {};
    virtual ~ValidatorSRSBandwidthCfg() {};

    virtual bool ValidateStringArray(const std::vector<std::string>& value, u32 minLength, u32 maxLength, s32 minValue, s32 maxValue, u32 maxInstances, ValidationFailureDescriptor& failureDescriptor);
};

#endif
