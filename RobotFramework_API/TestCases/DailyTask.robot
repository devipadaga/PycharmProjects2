*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${actual_URL}               https://www.facebook.com/
${CreateAccText}            xpath=//a[text()='Create new account']
${actual_CreateAccText}     Create new account


*** Keywords ***
Open facebook Application
    Open Browser   https://www.fb.com/       Chrome
    Maximize Browser Window

Validate URL
    ${tempURL}=    Get Location
    Log    URL is ${tempURL}

    IF    "${tempURL}==${actual_URL}"
        Log    URL is same
    ELSE
        Log    URL is Different
    END

Check Create Account
   # Element Should Be Visible    ${CreateAccText}
    ${CreateAccText_Value}=    Get Text    ${CreateAccText}
    IF    "${CreateAccText_Value}==${actual_CreateAccText}"
        Log    CreateAccount is present
    ELSE
        Log    CreateAccount is not present
    END


*** Test Cases ***
FacebookValidation
    Open facebook Application
    Validate URL
    Check Create Account




