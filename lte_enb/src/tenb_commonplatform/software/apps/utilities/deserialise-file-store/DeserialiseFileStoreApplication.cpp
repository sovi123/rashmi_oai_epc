///////////////////////////////////////////////////////////////////////////////
//
// DeserialiseFileStoreApplication.cpp
//
// See header file for documentation.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <system/SerialisableFileStore.h>
#include <system/SerialisationIds.h>
#include <system/KpiGroup.h>
#include <system/AlarmEvent.h>
#include <system/Trace.h>
#include <platform/FapAlarmId.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "DeserialiseFileStoreApplication.h"

using namespace std;
using namespace boost;
using namespace threeway;

///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////

DeserialiseFileStoreApplication* DeserialiseFileStoreApplication::s_instance = NULL;

DeclareAppVersionStamp

///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

DeserialiseFileStoreApplication::DeserialiseFileStoreApplication() :
    Application("deserialise-file-store")
{
    ENTER();

    EXIT();
}

DeserialiseFileStoreApplication::~DeserialiseFileStoreApplication()
{
    ENTER();

    EXIT();
}

DeserialiseFileStoreApplication& DeserialiseFileStoreApplication::GetInstance()
{
    ENTER ();

    if(s_instance == NULL)
    {
        s_instance = new DeserialiseFileStoreApplication();
    }

    RETURN (*s_instance);
}

shared_ptr<threeway::Serialisable> DeserialiseFileStoreApplication::GetSerialisable(
                                            u32 serialisationId,
                                            const u8* serialisedData,
                                            u32 serialisedDataLen
                                                       )
{
    ENTER();

    shared_ptr<Serialisable> object;

    switch(serialisationId)
    {
    case SERIALISATION_ID_KPI_GROUP:
        object.reset(new KpiGroup);
        if(object->DeSerialise(serialisedData, serialisedDataLen) == false)
        {
            object.reset();
        }
        break;
    case SERIALISATION_ID_ALARM_EVENT:
        shared_ptr<AlarmEvent> alarmEvent(new AlarmEvent);
        shared_ptr<AlarmId> alarmId(new FapAlarmId);
        alarmEvent->SetAlarmId(alarmId);
        alarmEvent->DeSerialise(serialisedData, serialisedDataLen);
        object = alarmEvent;
        break;
    }

    RETURN(object);
}

int DeserialiseFileStoreApplication::Main(int argc, char * argv[])
{
    ENTER();

    const char * fileName = GetCmdLineArgument("-f");

    if(fileName == NULL)
    {
        TRACE_PRINTF("No filename supplied.  Use -f <filename>.");
        RETURN(-1);
    }

    SerialisableFileStore serialisableFileStore(fileName, *this, false /* don't flush and sync each write */);

    serialisableFileStore.Open();

    SerialisableFileStore::ReadResult readResult = SerialisableFileStore::READ_OK;
    shared_ptr<Serialisable> object;
    u32 count = 0;

    while(readResult == SerialisableFileStore::READ_OK)
    {
        object = serialisableFileStore.ReadObject(readResult);

        if(readResult == SerialisableFileStore::READ_ERROR)
        {
            TRACE_PRINTF("%" PRIu32 ": ERROR READING FROM FILE\n", count);
        }

        if(object != NULL)
        {
            TRACE_PRINTF("%" PRIu32 ": %s\n", count, object->ToString().c_str());
            count++;
        }
    }

    RETURN(0);
}

///////////////////////////////////////////////////////////////////////////////
// Entry Point
///////////////////////////////////////////////////////////////////////////////

int main (int argc, char **argv)
{
    Trace::GetInstance().DisableFileLogging();

    int result = DeserialiseFileStoreApplication::GetInstance().Run(argc, argv);
    return result;
}
