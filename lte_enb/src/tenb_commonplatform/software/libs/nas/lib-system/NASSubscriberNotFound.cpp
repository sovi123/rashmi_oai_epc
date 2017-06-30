///////////////////////////////////////////////////////////////////////////////
//
// 3 Way Networks Source File
//
///////////////////////////////////////////////////////////////////////////////
//
// NASSubscriberNotFound.cpp
//
// Base application Exception class.
//
// Copyright ? 3 Way Networks, Ltd.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////
//CODE_CLEANUP
#if 0
#include <NASTrace.h>
#include <string.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "NASSubscriberNotFound.h"

///////////////////////////////////////////////////////////////////////////////
// Local Definitions
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Class: NASSubscriberNotFound
//
// Look after exceptions.
//
///////////////////////////////////////////////////////////////////////////////
NASSubscriberNotFound::NASSubscriberNotFound (const char *fileId, u32 lineNum, const c_MobileId &subscriberIdentity) :
	NASException (fileId, lineNum)
{
	NAS_ENTER ();
	memcpy (&m_subscriberIdentity, &subscriberIdentity, sizeof (c_MobileId));
	NAS_EXIT ();
}

NASSubscriberNotFound::~NASSubscriberNotFound ()
{
	NAS_ENTER ();
	NAS_EXIT ();
}

const c_MobileId &NASSubscriberNotFound::GetSubscriberIdentity () const
{
	NAS_ENTER ();
	NAS_RETURN (m_subscriberIdentity);
}

#endif /*0*/
