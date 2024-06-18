*** Settings ***
Library           SeleniumLibrary
#Library           Clipboard

*** Variables ***
${URL1}              https://www.facebook.com/
${URL2}              https://www.ironspider.ca/forms/textfields.htm
${BROWSER}           chrome
${text-xpath}        //h2[contains(text(), 'Facebook helps you connect')]
${target-element}    //textarea[@name='comments']
@{text}              test

*** Keywords ***
Open Browser And Copy Text
    Open Browser    ${URL1}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    ${temp}=      Get Text   ${text-xpath}
    Set Global Variable    @{text}  ${temp}
     Log To Console    @{text}
    #Copy To Clipboard    ${text}
    Close Browser

Open Another Browser And Paste Text
    Open Browser    ${URL2}    ${BROWSER}
    Maximize Browser Window
    Log To Console    @{text}
#    ${text}=    Paste From Clipboard
    Input Text   ${target-element}    @{text}
    Sleep    10s
#   Close Browser


*** Test Cases ***
Copy Text From One Browser And Paste It In Another
    [Documentation]    Open two browsers, copy text from one, and paste it into another
    Open Browser And Copy Text
    Open Another Browser And Paste Text