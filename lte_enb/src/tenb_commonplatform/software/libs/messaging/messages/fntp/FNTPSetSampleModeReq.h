///////////////////////////////////////////////////////////////////////////////
//
// FNTPSetSampleModeReq.h
//
// Implementation of the FNTPSetSampleModeReq message.
//
// Copyright � 3Way Networks Ltd
//
///////////////////////////////////////////////////////////////////////////////
#ifndef FNTPSETSAMPLEMODEREQ_H_
#define FNTPSETSAMPLEMODEREQ_H_
///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <3waytypes.h>
#include <string>
#include <system/Serialisable.h>
#include <system/SerialisationIds.h>

//////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Message Constants
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Message Structures
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Typedefs
///////////////////////////////////////////////////////////////////////////////
enum tSampleMode
{
    FAST_CONVERGENCE,
    LONG_TERM,
};
///////////////////////////////////////////////////////////////////////////////
// Functions
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Classes
///////////////////////////////////////////////////////////////////////////////
namespace threeway
{
class FNTPSetSampleModeReq : public threeway::Serialisable
{
    static const u32 MESSAGE_DATA_LEN = 4;
public :
    FNTPSetSampleModeReq():m_sampleMode(FAST_CONVERGENCE) {};
    FNTPSetSampleModeReq(tSampleMode sampleMode);
    ~FNTPSetSampleModeReq();
    tSampleMode GetSampleMode(void) {return(m_sampleMode);}
    virtual u32  GetSerialisationId() const {return(SERIALISATION_ID_FNTP_SET_SAMPLE_MODE_REQ);};
    virtual s32  Serialise(u8* data, u32 dataMaxBytes) const;
    virtual bool DeSerialise(const u8* data, u32 dataLen);
    /**
     * Convert to string for debug.
     */
    virtual std::string ToString() const;
private:
    tSampleMode m_sampleMode;
};
}
#endif /*FNTPSETSAMPLEMODEREQ_H_*/