///////////////////////////////////////////////////////////////////////////////
//
// $Id: CarbOscDacWriteReq.h 28331 2010-07-17 15:25:20Z mmcternan $
//
// CarbOscDacWriteReq message.
//
// Copyright � 3Way Networks Ltd
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __CarbOscDacWriteReq_h_
#define __CarbOscDacWriteReq_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#ifdef __cplusplus
#include <string>
#include <system/Serialisable.h>
#endif
#include <system/SerialisationIds.h>

///////////////////////////////////////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////////////////////
// Functions
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Classes
///////////////////////////////////////////////////////////////////////////////

#ifdef __cplusplus

namespace threeway
{

/** Message to set the oscillator DAC to some value.
 * \ingroup Carb
 */
class CarbOscDacWriteReq : public threeway::Serialisable
{
public:
    /*
     * Construction / destruction.
     */
    CarbOscDacWriteReq() { m_dacValue = 0; };

    /** Construct message to program the oscillator DAC to some value.
     * \param[in] val  The value to be programmed to the DAC.
     */
    CarbOscDacWriteReq(u16 val);

    virtual ~CarbOscDacWriteReq() {};

    /*
     * Implement Serialisable pure virtuals.
     */
    virtual u32  GetSerialisationId() const { return SERIALISATION_ID_CARB_OSC_DAC_WRITE_REQ; };
    virtual s32  Serialise(u8* data, u32 dataMaxBytes) const;
    virtual bool DeSerialise(const u8* data, u32 dataLen);

    /*
     * Accessors.
     */

    /** Get the word with which to program the DAC.
     */
    u16    GetDacValue() const  { return m_dacValue; }


    /**
     * Convert to string for debug.
     */
    virtual std::string ToString() const;
    virtual std::string ToBriefString() const;

private:

    u16    m_dacValue;
};

}

#endif // __cplusplus

#endif // __CarbOscDacWriteReq_h_
