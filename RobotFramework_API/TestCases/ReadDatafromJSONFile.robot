** Settings ***
Library      RequestsLibrary
Library    Collections
Library     JSONLibrary
Library     os

*** Test Cases ***
Read data from JSON_File
    ${JSON_FilePath}=    Load Json From File    C:\\Users\\SPURGE\\Desktop\\Jsonfile.json
    
    ${name_value}=       Get Value From Json         ${JSON_FilePath}    $.firstName
    Log To Console       ${name_value[0]}
    Should Contain       ${name_value[0]}        Devi

    ${city_value}=       Get Value From Json         ${JSON_FilePath}    $.address.City
    Should Contain       ${city_value}       Hyderabad

    ${faxNum_value}=       Get Value From Json         ${JSON_FilePath}    $.PhoneNumber[1].number
    Should Contain       ${faxNum_value}       646 555-4567


#    Exceptions:
#	1.No Route To Host Exception  ===>  Base URI is wrong
#	2.



#Authentication  ===>  Valid or not
#Authorization  ===? giving access or not
#
#Types of Authentication:
#	1. Basic
#	2.Digest           ====> These 3 uses username and password for authentication but internally alogorithems are diff
#	3. Preemptive
#
#	4.Bearer Token
#	5.OAuth
#	6.API Key