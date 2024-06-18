*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}     name=username
${PASSWORD}     name=password
${LOGIN}        xpath=//button[@type="submit"]
${My_info_Btn}  xpath=//ul[@class="oxd-main-menu"]/li[6]/a
${clickImg}     xpath=//div[@class="orangehrm-edit-employee-image"]
${plusBtn}      xpath=//div[@class="oxd-file-div oxd-file-div--active"]/button[@type="button"]
${save}         xpath=//button[@type="submit"]


*** Keywords ***
Launch OrangeHRM Application
    Open Browser        ${URL}      Chrome
    Maximize Browser Window
    #Delete All Cookies
    Sleep    3s
    
Login
    Input Text    ${USERNAME}    Admin
    Input Password    ${PASSWORD}    admin123
    Sleep    5s
    Click Element    ${LOGIN}
    Sleep    5s

UploadImage
    Wait Until Element Is Visible    ${My_info_Btn}
    Click Element    ${My_info_Btn}
    Wait Until Element Is Visible    ${clickImg}
    Click Element    ${clickImg}
    Wait Until Element Is Visible    ${plusBtn}
    Click Element    ${plusBtn}
    sleep   4s
    Choose File    ${plusBtn}    C:\\Users\\SPURGE\\Downloads\\flower.jpg
    Set Selenium Implicit Wait    10s
    Click Element    ${save}


*** Test Cases ***
OrangeHRM
    Launch OrangeHRM Application
    Login
    UploadImage
