*** Settings ***
Library      XML
Library    Collections
Library     OS

*** Test Cases ***
TC1
    ${xmlFile_Path}=    Parse Xml    ${EXECDIR}\\TestData\\XmlFile.xml
    
    ${var1_Text}=    Get Element Text    ${xmlFile_Path}     ./types/element[2]
    Log To Console    ${var1_Text}
    Should Be Equal    ${var1_Text}    shop

    ${var1}=    Get Element    ${xmlFile_Path}     ./types/element[2]
    ${var1_value}=    Get Element Text   ${var1}
    Should Be Equal    ${var1_value}    shop
    
    ${count}=    Get Element Count    ${xmlFile_Path}    .//types/element
    Should Be Equal As Integers   ${count}    2

    Element Attribute Should Be    ${xmlFile_Path}    .//name    Frontline house
    