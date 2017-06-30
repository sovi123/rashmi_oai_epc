# Generate a sample XML document from TR196 one


import DataModelCodeGenerator
from xml.dom import minidom

TEST_DIR = '../../fap/management/tr069-v2/autogen-test'
SAMPLE_TR196_XML_FILE = '../../fap/management/tr069-v2/autogen-test/SampleFromTr196.xml'
SAMPLE_TR196_HEADER_FILE = '../../fap/management/tr069-v2/autogen-test/SampleFromTr196_data_model.h'

FIRST_TAG   = '<dm:document xmlns:dm="urn:broadband-forum-org:cwmp:datamodel-1-0" \n\txmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\n\txsi:schemaLocation="urn:broadband-forum-org:cwmp:datamodel-1-0 cwmp-datamodel.xsd">\n'
LAST_TAG    = '</dm:document>'


class SampleGenerator:
    """Generate a sample XML file from TR196 one, for an cross-check test"""
    
    def __init__(self):
        print 'Init'
        #self.subList = []        
        
    def extractFromSource(self, file):
        xmldoc = minidom.parse(file)
        
        self.objectList = xmldoc.getElementsByTagName("object")

        print ' length of element list is ' , len(self.objectList) 
        self.__removeProfileObjs()
        print ' length of element list after removing <profile> is ' , len(self.objectList)
        
        import os
        if 'autogen-test' not in os.listdir('../../fap/management/tr069-v2/'):
            os.mkdir(TEST_DIR)
        
        import random     

        mibGroupCounter = 0
        
        while mibGroupCounter == 0:
            # ensure there is a least one <mibGroup> value
            
            sampleFile = open(SAMPLE_TR196_XML_FILE, 'w')
            sampleFile.write('<?xml version="1.0" encoding="UTF-8"?>\n')
            sampleFile.write(FIRST_TAG)       
            
            samplesCounter = 0
            
            while samplesCounter < 5:
                randomNumber = random.randint(1, (len(self.objectList)-1) )
                obj = self.objectList[ randomNumber ]
                objStr = obj.toxml()                        
                
                if self.__checkSupported(objStr):            
                    #self.subList.append( obj )
                    sampleFile.write( objStr.encode("utf-8") )
                    sampleFile.write('\n\n')
                    if self.__checkMibGroup(objStr):
                        mibGroupCounter += 1            
                    samplesCounter += 1
           
            sampleFile.write(LAST_TAG)
            sampleFile.close()
                    

    def __removeProfileObjs(self):
        for item in self.objectList:
            if item.parentNode.tagName  == 'profile':
                self.objectList.remove(item)
        

    def __checkSupported(self, node):
        supported = False
        if node.count('supported=\"TRUE\"') > 0:
            supported = True
        return supported

    
    def __checkMibGroup(self, node):
        groups = 0
        spl = node.split('mibGroup>')
        if spl.__len__() > 1:
            #print spl[1]
            if spl[1] != '</':            
                groups = 1
        return groups



if __name__ == '__main__':
    
    print 'Note: sample XML file is an existing one, no longer autogenerated, to allow unitest to wrok properly'
    #print 'Generating Sample XML document'
    #sg = SampleGenerator()   
    #sg.extractFromSource(DataModelCodeGenerator.TR196_XML_FILE)



    startMsg = DataModelCodeGenerator.AUTOCODE_MSG
    startMsg += "{\"InternetGatewayDevice.Service.FAPServiceNumberOfEntries\",\n"
    startMsg += "\tREAD_ONLY, U_INT, \"1\", \"1\", NO_NOTIFICATION, false,\t\"1\", \"\", PARAM_ID_INVALID },\n"

    CG = DataModelCodeGenerator.CodeGenerator(SAMPLE_TR196_XML_FILE, SAMPLE_TR196_HEADER_FILE, DataModelCodeGenerator.TR196_PREFIX,
                                              DataModelCodeGenerator.tr196_MultipleObjCounter, 'Radisys', fileStart=startMsg)
    
    CG.processXMLFile()

    GroupNameList = []
    
    for item in CG.mibGroups:
        if item not in GroupNameList:
            GroupNameList.append(item)

    print "* * Creating .cpp file"   
    l = SAMPLE_TR196_HEADER_FILE.split('/')
    hdr = l[l.__len__()-1]
    cpp = DataModelCodeGenerator.Tr069FilesGenerator('../../fap/management/tr069-v2/autogen-test/Tr069DataModel.cpp', 
                                                    ['Radisys'], [hdr])       
    cppf = open('../../fap/management/tr069-v2/autogen-test/Tr069DataModel.cpp', 'r')
    oldFile = cppf.read()
    cppf.close()
    strsplit = oldFile.split('};')
    newFile = strsplit[0] + '#include \"SampleFromTr196_data_model.h\"\n};\n' + strsplit[1]
    cppf = open('../../fap/management/tr069-v2/autogen-test/Tr069DataModel.cpp', 'w')
    cppf.write(newFile)
    cppf.close()    

    MGFP = DataModelCodeGenerator.MibGroupFunctionProto('../../fap/management/tr069-v2/autogen-test/MibGroup.h', GroupNameList)
    fpList = MGFP.GetProtoNamesList()
    
    DataModelCodeGenerator.MibGroupFunctionEnum('../../fap/management/tr069-v2/autogen-test/MibGroupEnum.h', GroupNameList)
    
    DataModelCodeGenerator.FuncPtrTableGenerator('../../fap/management/tr069-v2/autogen-test/FuncPtrTable.h', GroupNameList, fpList)   

    print '\n\nDone, please check auto-generated file\n'
