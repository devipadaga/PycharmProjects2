*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${DOWNLOAD_DIR}     C:\\Users\\SPURGE\\PycharmProjects\\RobotFramework_Healenium\\newDirectory
${DOWNLOAD_URL}       https://www.pexels.com/collections/cars-m83q4nh/
${IMAGE}            //img[@alt='Free Suv On Brown Sand Stock Photo']
${DOWNLOAD}      ((//div[@class="spacing_noMargin__F5u9R spacing_mb30__2jTSp"]//div[@data-testid="column"])[1]//a[@title="Download"])[3]

${CHROMEDRIVER_PATH}    C:\Drivers\chromedriver-win64\chromedriver.exe
${UPLOAD_URL}         https://demoqa.com/upload-download
${UPLOAD_BUTTON}      //input[@type='file']
${SUBMIT_BUTTON}      //button[@id='submit']


*** Test Cases ***
Download And Upload File
    [Documentation]    Download a file and then upload it to another URL
    Delete File
    Set Chrome Download Directory    ${DOWNLOAD_DIR}
    Download File
#
    Upload File
    #[Teardown]    Close Browser



*** Keywords ***
Set Chrome Download Directory
    [Arguments]    ${download_dir}
    Create Directory    ${download_dir}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}=    Create Dictionary    download.default_directory=${download_dir}
    Call Method    ${options}    add_experimental_option    prefs       ${prefs}             #{'download.default_directory': '${download_dir}'}
    Create WebDriver    Chrome    options=${options}

Download File
    Go To    ${DOWNLOAD_URL}
    Maximize Browser Window
    Mouse Down          ${IMAGE}
    Sleep    2s
    Mouse Over          ${IMAGE}
    Click Element        ${DOWNLOAD}
    Sleep    2s
#    Wait Until Keyword Succeeds    1 min    2 sec    File Should Exist    ${DOWNLOAD_DIR}/${FILE_NAME}

Upload File
    Go To    ${UPLOAD_URL}
 #   Choose File    ${UPLOAD_BUTTON}    ${DOWNLOAD_DIR}/${FILE_NAME}
     ${file}=   Get Download FilePath
     Sleep    3s
    Input Text    ${UPLOAD_BUTTON}       ${file}
    Log To Console    uploaded
#    Click Button    ${SUBMIT_BUTTON}
#    Wait Until Page Contains    Upload successful

File Should Exist
    [Arguments]    ${file_path}
    File Should Exist    ${file_path}

Get Download FilePath
    ${file_List}=   List Directory    ${DOWNLOAD_DIR}
    ${file_name}=   Get From List   ${file_List}    0
    ${file_path}=   Set Variable    ${DOWNLOAD_DIR}\\${file_name}
    Log     ${file_path}
    RETURN  ${file_path}

Delete File
     ${file_List}=   List Directory    ${DOWNLOAD_DIR}
     ${file_name}=   Get From List   ${file_List}    0
 #   ${directory}=   Get Download FilePath
     File Should Not Exist    ${file_name}
 #   Run Keyword If    ${file_name}    File Should Exist    ${file_name}
     Remove File     ${DOWNLOAD_DIR}\\${file_name}
