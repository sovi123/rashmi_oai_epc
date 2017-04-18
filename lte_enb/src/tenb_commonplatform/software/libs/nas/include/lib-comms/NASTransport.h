///////////////////////////////////////////////////////////////////////////////
//
// 3 Way Networks Source File
//
///////////////////////////////////////////////////////////////////////////////
//
// NASTransport.h
//
// Connectionless message transfer using UDP.
//
// Copyright � 3 Way Networks, Ltd.
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __NASTransport_h_
#define __NASTransport_h_

///////////////////////////////////////////////////////////////////////////////
// Includes
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Forward Declarations
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Class: NASTransport
// Desc : Manage packing user data into a simple structure and sending it
//        to the specified address using UDP.
///////////////////////////////////////////////////////////////////////////////

#include "NASTransport_RedHat.h"

class NASTransport : public NASTransport_RedHat
{
public:
	// Construction / destruction.
	NASTransport (u16 receivePort = 0, u16 sendPort = 0, const char *destinationAddr = "127.0.0.1");
	virtual ~NASTransport ();
};

#endif

