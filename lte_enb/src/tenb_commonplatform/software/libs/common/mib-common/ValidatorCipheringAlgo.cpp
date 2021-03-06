///////////////////////////////////////////////////////////////////////////////
//
// ValidatorCipheringAlgo.cpp
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
#include <string.h>

#include <stdio.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////
#include "ValidatorCipheringAlgo.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

bool ValidatorCipheringAlgo::ValidateStringArray(const std::vector<std::string>& value, u32 minLength, u32 maxLength, s32 minValue, s32 maxValue, u32 maxInstances, ValidationFailureDescriptor& failureDescriptor)
{
   ENTER();

   bool validated = false;

   if( ValidatorStringArray::ValidateStringArray(value, minLength, maxLength, minValue, maxValue, maxInstances, failureDescriptor) )
   {
      for(u32 i = 0; i < value.size(); i++)
      {
         if(!strcmp(value.at(i).c_str(),"EEA0"))
         {
            validated = true;
         }
         else if(!strcmp(value.at(i).c_str(),"128-EEA1"))
         {
            validated = true;
         }
         else if(!strcmp(value.at(i).c_str(),"128-EEA2"))
         {
            validated = true;
         }
         else if(!strcmp(value.at(i).c_str(),"128-EEA3"))
         {
            validated = true;
            RETURN(true);
         }
         else
         {
            ostringstream description;
            description << "valid values are EEA0, 128-EEA1 and 128-EEA2";
            failureDescriptor.Set(failureDescriptor.GetCause(), description.str());
            RETURN(false);
         }
      }
   }

   RETURN(validated);

}
