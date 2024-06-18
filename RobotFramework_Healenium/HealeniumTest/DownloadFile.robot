*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL1}              https://www.pexels.com/collections/cars-m83q4nh/
${IMAGE}            //img[@alt='Free Suv On Brown Sand Stock Photo']
${DOWNLOAD}      ((//div[@class="spacing_noMargin__F5u9R spacing_mb30__2jTSp"]//div[@data-testid="column"])[1]//a[@title="Download"])[3]

${URL2}              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome
${USERNAME}     //input[@placeholder='Username']
${PASSWORD}     //input[@name='password']
${MyINFO}       //span[text()='My Info']
${PROFILE-IMAGE}    //div[@class="orangehrm-edit-employee-image"]
${PlusBtn}          //button[@class='oxd-icon-button oxd-icon-button--solid-main employee-image-action']
${SUBMIT}           //button[@type="submit"]

*** Keywords ***
Python Upload
    Open Browser        https://demoqa.com/upload-download           chrome
    Maximize Browser Window
    Sleep    5s
    Wait Until Element Is Visible    css=input[type='file']
    Input Text       css=input[type='file']               C:\\Users\\SPURGE\\Desktop\\cat.jpg



*** Test Cases ***
FileDownload
    Open Browser         ${URL1}        ${BROWSER}
    Maximize Browser Window
    Mouse Down          ${IMAGE}
    Sleep    2s
    Mouse Over          ${IMAGE}
#    Click Element        ${DOWNLOAD}

UploadFile
    Open Browser        ${URL2}      ${BROWSER}
    Maximize Browser Window
    sleep               2s
    Input Text          ${USERNAME}   Admin
    Sleep               2s
    Input Text          ${PASSWORD}    admin123
    Click Element        xpath=//button[@type='submit']
    Click Element        ${MyINFO}
    Click Element        ${PROFILE-IMAGE}
 #   Click Element       xpath=//button[@class='oxd-icon-button oxd-icon-button--solid-main employee-image-action']
    Click Element         ${PlusBtn}

     Input Text                      C:\Users\SPURGE\Downloads\pexels-alexazabache-3879065.jpg
    Click Element       ${SUBMIT}

FileUpload Test
    Python Upload