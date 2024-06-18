*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${URL}              https://www.flipkart.com/
${Electronics}      xpath=//div[@aria-label="Electronics"]
${Gaming}           xpath=//a[text()='Gaming']
${GamingMouse}      xpath=//a[text()='Gaming Mouse']
${product}          xpath=(//a[@class='s1Q9rs'])[1]
${searchBar}        xpath=//input[@name='q']
${search}           xpath=//button[@type="submit"]


*** Keywords ***
Launch Flipkart Application
    Open Browser        ${URL}      Chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

go to the Element
    Sleep    5s
    Mouse Over    ${Electronics}
    Sleep    2s
    Mouse Over    ${Gaming}
    Sleep    2s
    Mouse Over    ${GamingMouse}
    Sleep    2s
    Click Element    ${GamingMouse}

Getting Text of Elements
     @{elements1}=  Get WebElements    //a[@class="s1Q9rs"]
     Log    ${elements1.count}
    ${product_Name}=    Get Text    ${product}
    Input Text    ${searchBar}    ${product_Name}
    Click Element    ${search}


    @{elements}=  Get WebElements    //a[@class="s1Q9rs"]
    ${eleCount}=  Get Element Count   //a[@class="s1Q9rs"]
    Log   ${eleCount}
    
    FOR  ${eleIndex}   IN RANGE  ${eleCount}:
        ${text}=  Get Element Attribute    (${elements})[${eleIndex+1}]   title
        IF  ${text} == ${product_Name}:
            Click Element  ${elements}
            Log    Product matched
        BREAK
        END
    END


*** Test Cases ***
Automate Flipkart
    Launch Flipkart Application
    go to the Element
    Getting Text of Elements
