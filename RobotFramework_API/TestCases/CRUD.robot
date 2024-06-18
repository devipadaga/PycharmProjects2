*** Settings ***
Library      RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://gorest.co.in
${user_id}      5890297

${name}         $.name

*** Test Cases ***
POST_Request
    Create Session  session   ${base_url}
    ${json_obj}=    Create Dictionary     name=Kajal11112   email=kajal11112@gmail.com  gender=Female   status=Active
     ${body}=    Convert To String   ${json_obj}
    ${header}=  Create Dictionary     Content-Type=application/json  Authorization=Bearer d41ff1e7c93ba4ae72e04f9395edfdc07beeb22560664c513f4c32acff160b40


    ${response}=    POST On Session  session   /public/v2/users/     json=${json_obj}    headers=${header}


    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${response_body}=   Convert To String  ${response.content}
    Should Contain    ${response_body}    Kaj

    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal   ${status_code}      201

    #validating json response

#    ${json_response}=   ${response.json()}    ${response.content}
#    ${contents}=    Get Variable Value    ${json_response}  ${name}
#    Should Not Be Empty    ${contents}

GET_Request
    Create Session  session   ${base_url}
    ${header}=  Create Dictionary     Content-Type=application/json  Authorization=Bearer d41ff1e7c93ba4ae72e04f9395edfdc07beeb22560664c513f4c32acff160b40
    ${response}=  GET On Session  session   /public/v2/users/${user_id}   headers=${header}

    Log To Console    ${response.status_code}

    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal   ${status_code}      200
 #   Should Be Equal As Strings ${status_code} 200
    
    ${res_body}=   Convert To String  ${response.content}
    Should Contain    ${res_body}    Mr. Charumati Pillai

     ${contentType_Value}=  Get From Dictionary   ${response.headers}    Content-Type
     Should Contain   ${contentType_Value}    application/json; charset=utf-8

#    ${type string}=    Evaluate    type${response.headers}
#     Log to console     ${type string}



PUT_Request
    Create Session  session   ${base_url}
 #    ${json_obj}=    Create Dictionary     name=KajalAgarwal   email=kajalAgarwal1@gmail.com  gender=Female   status=Active
    ${json_obj}=    Catenate
                ...     {
                ...          "name": "Kajal",
                ...         "email": "kajal@gmail.com",
                ...         "gender": "female",
                ...         "status": "Active"
                ...     }
    ${header}=  Create Dictionary     Content-Type=application/json  Authorization=Bearer d41ff1e7c93ba4ae72e04f9395edfdc07beeb22560664c513f4c32acff160b40

    ${response}=  PUT On Session  session   /public/v2/users/${user_id}  json=${json_obj}   headers=${header}

    Log To Console    ${response.status_code}

    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal   ${status_code}      200
 #   Should Be Equal As Strings ${status_code} 200

    ${res_body}=   Convert To String  ${response.content}
    Should Contain    ${res_body}    KajalAgarwa

     ${contentType_Value}=  Get From Dictionary   ${response.headers}    Content-Type
     Should Contain   ${contentType_Value}    application/json; charset=utf-8


DELETE_Request
    Create Session  session   ${base_url}
    ${header}=  Create Dictionary     Content-Type=application/json  Authorization=Bearer d41ff1e7c93ba4ae72e04f9395edfdc07beeb22560664c513f4c32acff160b40
    ${response}=  DELETE On Session  session   /public/v2/users/${user_id}   headers=${header}

    Log To Console    ${response.status_code}

    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal   ${status_code}      203

