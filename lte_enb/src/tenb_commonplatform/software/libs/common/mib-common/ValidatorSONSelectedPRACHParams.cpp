///////////////////////////////////////////////////////////////////////////////
//
// ValidatorSONSelectedPRACHParams.cpp
//
// See header file for documentation.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <sstream>
#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorSONSelectedPRACHParams.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

bool ValidatorSONSelectedPRACHParams::ValidateU32(u32 value, u32 min, u32 max, ValidationFailureDescriptor& failureDescriptor)
{
    ENTER();

    bool isValid = false;
    if( value == 255)
    {
       isValid = true;
    }
    else
    {
       isValid = ValidatorU32::ValidateU32(value, min, max, failureDescriptor);
    } 

    RETURN(isValid);
}