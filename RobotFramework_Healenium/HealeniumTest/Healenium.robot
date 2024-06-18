*** Settings ***
Library           SeleniumLibrary
#Library             HealenuimLibrary

*** Variables ***
${URL}         C://Users//SPURGE//Desktop//Html%20Files//RegistrationPage.html
${USERNAME}     id=username
${EMAIL}        id=email
${PASSWORD}     id=password
${BROWSER}      chrome

*** Keywords ***
Open Remote Chrome Browser
    Open Browser    ${URL}     ${BROWSER}  remote_url=http://localhost:8085
    Maximize Browser Window
    #Delete All Cookies
    Sleep    3s

EnterText
    Input Text   ${USERNAME}    Tirumala
    Input Text   ${EMAIL}   Devi123@gmail.com
    Input Text    ${PASSWORD}    Kadiyam1@


*** Test Cases ***
HealeniumTest
    Open Remote Chrome Browser
    EnterText