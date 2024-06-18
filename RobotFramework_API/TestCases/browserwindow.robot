** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${URL}                  https://demoqa.com/browser-windows
${BROWSER}              Chrome

${New_Tab}              id=tabButton
${New_Tab_Verify}       id=sampleHeading

${New_Window}              id=windowButton
${New_Window_Verify}       id=sampleHeading

${msgWin_Btn}              id=messageWindowButton


*** Test Cases ***
HandlingTabs
    Open Browser To Login Page
    click on New Tab

HandlingWindows
    Open Browser To Login Page
    click on New Window

click on new msg
    Open Browser To Login Page
    click on NewMsgBtn


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s

click on New Tab
    Click Element    ${New_Tab}
    Sleep    3s
    Switch Window   url=https://demoqa.com/sample
    Element Text Should Be    ${New_Tab_Verify}    This is a sample page
    Close Window

click on New Window
    Click Element    ${New_Window}
    Sleep    3s

    ${handles}=    Get Window Handles
    Log To Console    ${handles}
    ${main_window}=    Get From List   ${handles}    0
    ${new_window}=    Get From List    ${handles}    1
    Switch Window    ${new_window}
    Maximize Browser Window
    Element Text Should Be    ${New_Window_Verify}    This is a sample page
    Switch Window    ${main_window}

click on NewMsgBtn

    Click Element    ${msgWin_Btn}
    Sleep    5s
    Maximize Browser Window


#    @{WindowHandles}=  Get Window Handles
#    Log    @{WindowHandles}
#    Sleep    4s
#
#    @{WindowIdentifier}=  Get Window Identifiers
#    Sleep    4s
#
#    @{WindowNames}=  Get Window Names
#    Sleep    4s
#
#    @{WindowTitle}=  Get Window Titles
#    Sleep    4s
#
#
#    Switch Window  @{WindowHandles}[1]
#    Log @{WindowHandles}[1]
#    Sleep   4s
#
#    Element Text Should Be    ${New_Tab_Verify}    This is a sample page
#
#
#    Close Window
#    Sleep   4s
#
#
#    Switch Window   @{WindowHandles}[0]



