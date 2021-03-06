///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "TenpinOsLayer.h"

using namespace threeway;

///////////////////////////////////////////////////////////////////////////////
// Private Data
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

FILE * TenpinOsLayer::OpenFile(
    const char *    reason,
    const char *    filename,
    const char *    mode
)
{
    FILE * fp = fopen(filename, mode);

    TRACE_PRINTF("%s file '%s' with mode '%s' for %s", (fp ? "opened" : "failed to open"), filename, mode, reason);

    return fp;
}

void TenpinOsLayer::DoCommand(
    const char *    reason,
    const char *    command
)
{
    TRACE_PRINTF("%s using command '%s'", reason, command);
    if( system(command) != oam_ret_zero )
	{
	  TRACE_MSG("TenpinOsLayer::DoCommand, System Command Failed");
	}
}
