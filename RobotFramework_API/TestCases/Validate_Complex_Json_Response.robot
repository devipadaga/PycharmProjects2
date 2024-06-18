** Settings ***
Library      RequestsLibrary
Library    Collections
Library     JSONLibrary

*** Variables ***
${base_url}     https://reqres.in/


*** Test Cases ***
Validate Complex Json Response
    Create Session  session   ${base_url}
    ${response}=  GET On Session  session   /api/unknown
    ${JSON_Response}=   To Json    ${response.json()}
    Log To Console    ${JSON_Response}
