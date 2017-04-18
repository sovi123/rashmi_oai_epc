///////////////////////////////////////////////////////////////////////////////
//
// Tr069DeleteObjectResponse.h
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __Tr069DeleteObjectResponse_h_
#define __Tr069DeleteObjectResponse_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <sstream>
#include <string>
#include <boost/shared_ptr.hpp>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////
#include "Tr069Application.h"
#include "Tr069XmlStringUtils.h"

using namespace std;
using namespace boost;
using namespace tr069;

namespace tr069
{

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Typedefs
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Forward Declarations
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Functions / Classes
///////////////////////////////////////////////////////////////////////////////

class DeleteObjectResponse : public Xmlable
{
public:
    DeleteObjectResponse( u32 instanceNumber) :
        m_instanceNumber(instanceNumber)
    {
        TRACE_PRINTF("DeleteObjectResponse()");
    }

    virtual ~DeleteObjectResponse()
    {}

    bool QueryValid() const
    {
        return true;
    }

    string Xmlise() const
    {
        string xmlString;
        stringstream value;
if(QueryValid())
        {
            stringstream instance;
            instance << m_instanceNumber;

            value
            << XmlStringUtils::ToElementString("Status", "0" );
        }
        else
        {
            TRACE_PRINTF("DeleteObjectResponse::Xmlise(invalid)")
        }

        xmlString = XmlStringUtils::ToElementString("cwmp:DeleteObjectResponse", value.str());
      return xmlString;
    }

private:
    u32 m_instanceNumber;
};

}

#endif
