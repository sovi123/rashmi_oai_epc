///////////////////////////////////////////////////////////////////////////////
//
// KpiMessageManager.h
//
// Manager of KPIs, implementor of Message-Handler interface.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////


#ifndef __KpiMessageManager_h_
#define __KpiMessageManager_h_

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////
#include <boost/shared_ptr.hpp>
#include <system/KpiCollector.h>
#include <messaging/messages/common/MessagingDataInd.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////
#include "Messenger.h"
#include "MessageSerialisedData.h"
#include "MessageHandler.h"

using namespace std;
using namespace boost;

namespace threeway
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

class KpiMessageManager : public IMessageHandler
{

public:
    KpiMessageManager( MessagingEntity entity, SendMessageInterface & sendMessageInterface);
    ~KpiMessageManager();

    /**
     * Register a KPI collector for a particular entity.
     */
    void RegisterKpiCollector(MessagingEntity entity, shared_ptr<KpiCollector> kpiCollector);

private:
    // Typedef
    typedef map< MessagingEntity, shared_ptr<KpiCollector> > KpiCollectors;

    // Implement MessageHandler interface
    virtual bool MessageHandler(shared_ptr<threeway::MessageSerialisedData> & message);

    void HandleKpiReadReqMessage(shared_ptr<MessageSerialisedData> message);

    // KPI collector.
    KpiCollectors m_kpiCollectors;

    MessagingEntity m_thisEntity;
    SendMessageInterface & m_sendMessageInterface;
};

}

#endif