*** Settings ***
Library           SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${URL}                  https://demoqa.com/webtables        #https://testautomationpractice.blogspot.com/
${BROWSER}              Chrome
${rowXpath}             xpath=//div[@class="rt-table"]/div[2]/div
${colXpath}             xpath=//div[@class="rt-table"]/div[2]/div[1]/div/div

*** Test Cases ***
HandlingWebTables
    Open Browser   ${URL}   ${BROWSER}
    ${No.ofRows}=    Get Element Count    ${rowXpath}
    Log To Console    ${No.ofRows}
    ${No.ofCols}=    Get Element Count    ${colXpath}
    Log To Console    ${No.ofCols}

    ${data}=  Get Text    xpath=//div[@class="rt-table"]/div[2]/div[2]/div/div[2]
    Log To Console    ${data}
    
    Table Column Should Contain    xpath=//div[@class="rt-table"]    2   LastName
    Table Row Should Contain    locator    2    Alden
