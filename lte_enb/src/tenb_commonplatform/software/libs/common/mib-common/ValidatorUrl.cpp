///////////////////////////////////////////////////////////////////////////////
//
// ValidatorUrl.cpp
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
#include <algorithm>
#include <stdlib.h>
#include <system/Trace.h>
#include <system/Url.h>


#include <stdio.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "ValidatorUrl.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

bool ValidatorUrl::ValidateString(const std::string& value, u32 minLength, u32 maxLength, ValidationFailureDescriptor& failureDescriptor)
{
    ENTER();

    bool validated = false;

    if( ValidatorString::ValidateString(value, minLength, maxLength, failureDescriptor) )
    {
        if(threeway::Url::FromString(value))
        {
            validated = true;
        }
    }

    RETURN(validated);
}
