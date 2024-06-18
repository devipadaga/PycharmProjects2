* Settings ***
Library      RequestsLibrary
Library    Collections


*** Variables ***
${base_url}     http://restapi.demoqa.com


*** Test Cases ***
Validate XML Response
    Create Session  session   ${base_url}
    ${response}=  GET On Session  session   /authentication/CheckForAuthentication
    Log To Console    ${response.content}