///////////////////////////////////////////////////////////////////////////////
//
// 3 Way Networks Source File
//
///////////////////////////////////////////////////////////////////////////////
//
// NASSocketException.cpp
//
// Win Socket Exception class.
//
// Copyright � 3 Way Networks, Ltd.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <lib-system/NASTrace.h>
#include <NASString.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "NASSocketException.h"

///////////////////////////////////////////////////////////////////////////////
// Local Definitions
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Class: NASSocketException
//
// Look after socket layer exceptions.
//
///////////////////////////////////////////////////////////////////////////////
NASSocketException::~NASSocketException()
{
	NAS_ENTER();
	NAS_EXIT();
}

NASSocketException::NASSocketException (const char *fileName, u32 lineNumber, s32 nasSocketException) :
    NASException (fileName, lineNumber, "%d", nasSocketException),
	m_nasSocketException (nasSocketException)
{
	NAS_ENTER();

	snprintf (m_errorMessage, sizeof(m_errorMessage), "Socket Error %" PRId32 " - No Further Information Available\n", m_nasSocketException);

	NAS_EXIT();
}

s32 NASSocketException::GetType() const
{
	NAS_ENTER();
    NAS_RETURN (m_nasSocketException);
}

const char *NASSocketException::what() const
{
	NAS_ENTER();
    NAS_RETURN (m_errorMessage);
}
