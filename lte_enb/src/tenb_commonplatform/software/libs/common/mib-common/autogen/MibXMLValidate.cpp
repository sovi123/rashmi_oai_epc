///////////////////////////////////////////////////////////////////////////////
//
// MibXMLValidate.cpp
//
// See header file for documentation.
//
// Copyright Radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// System Includes
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <cstdio>

#include <libxml/xmlschemas.h>

#include <system/Trace.h>

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "MibXMLValidate.h"

using namespace std;

// TODO: Delete unused sections below.

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Typedefs
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Static Data
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Class Functions
///////////////////////////////////////////////////////////////////////////////

MibXMLValidate::MibXMLValidate(const std::string & schemaFile)
{
//    ENTER();

    m_schemaDoc = xmlParseFile(schemaFile.c_str());

    m_schemaCtxt = xmlSchemaNewDocParserCtxt(m_schemaDoc);

    m_wxschemas = xmlSchemaParse (m_schemaCtxt);

    m_schemaValidCtxt = xmlSchemaNewValidCtxt(m_wxschemas);
    xmlSchemaSetValidErrors(m_schemaValidCtxt,
            (xmlSchemaValidityErrorFunc) fprintf,
            (xmlSchemaValidityWarningFunc) fprintf,
            stderr);

//    EXIT();
}

MibXMLValidate::~MibXMLValidate()
{
//    ENTER();

    xmlSchemaFreeValidCtxt(m_schemaValidCtxt);
    xmlSchemaFree (m_wxschemas);
    xmlSchemaFreeParserCtxt(m_schemaCtxt);
    xmlFreeDoc(m_schemaDoc);

//    EXIT();
}


bool MibXMLValidate::IsValid(const std::string & xmlFile)
{
    int ret;
    xmlDocPtr xmlDoc = xmlParseFile(xmlFile.c_str());

    ret = xmlSchemaValidateDoc(m_schemaValidCtxt, xmlDoc);

    if (ret == 0) {
        std::cerr << xmlFile << " validates" << std::endl;
    } else if (ret < 1) {
        std::cerr << xmlFile << " fails to validate" << std::endl;
    } else {
        std::cerr << xmlFile << " validation generated an internal error" << std::endl;
    }

    xmlFreeDoc(xmlDoc);

    return(ret == 0);
}
