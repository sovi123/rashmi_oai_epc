///////////////////////////////////////////////////////////////////////////////
//
// 3 Way Networks Source File
//
///////////////////////////////////////////////////////////////////////////////
//
// NASSocketException.h
//
// Class for handling Socket library exceptions.
//
// Copyright � 3 Way Networks, Ltd.
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __NASSocketException_h_
#define __NASSocketException_h_

///////////////////////////////////////////////////////////////////////////////
// Includes
///////////////////////////////////////////////////////////////////////////////

#include "NASException.h"

///////////////////////////////////////////////////////////////////////////////
// Forward Declarations
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Class: NASSocketException
// Desc : Really just a string representation of integer socket error
//        numbers.
///////////////////////////////////////////////////////////////////////////////
class NASSocketException : public NASException
{
public:
    // Constructor; defaulted to get the error flag out of the socket library.
	NASSocketException (const char *fileName, u32 lineNumber, s32 NASSocketException = -1);

    virtual ~NASSocketException();

	s32 GetType() const;

	// Override base for custom error display.
    virtual const char *what () const;

private:

    // The specific type of this WinSock exception 
    s32 m_nasSocketException;

    // Text representation of the socket error.
    char m_errorMessage[1024];
};

#endif

