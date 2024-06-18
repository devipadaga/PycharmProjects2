* Settings ***
Library      RequestsLibrary
Library    Collections
Library     JSONLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com


*** Test Cases ***
Validate XML Response
    Create Session  session   ${base_url}
    ${response}=  GET On Session  session   /photos

    Log To Console    ${response.headers}
    
    ${ContentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${ContentTypeValue}    application/json; charset=utf-8

    ${AccessControlValue}=    Get From Dictionary    ${response.headers}    Access-Control-Allow-Credentials
    Should Be Equal    ${AccessControlValue}   true

    ${X-Ratelimit-LimitValue}=    Get From Dictionary    ${response.headers}  X-Ratelimit-Limit
    Should Be Equal As Integers   ${X-Ratelimit-LimitValue}   1000


Validate Cookies
    Create Session  session   ${base_url}
    ${response}=  GET On Session  session   /photos

    Log To Console    ${response.cookies}

    ${CookieValue}=    Get From Dictionary    ${response.cookies}  CookieName
    Log To Console  ${CookieValue}