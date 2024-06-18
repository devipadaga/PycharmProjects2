*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${URL}          https://www.spicejet.com/
${FROM}         xpath=(//input[@class='css-1cwyjr8 r-homxoj r-ubezar r-10paoce r-13qz1uu'])[1]
${TO}           xpath=(//input[@class='css-1cwyjr8 r-homxoj r-ubezar r-10paoce r-13qz1uu'])[2]
${Departure}    xpath=//div[@data-testid='departure-date-dropdown-label-test-id']
${Month_Year}   xpath=(//div[@class='css-1dbjc4n r-k8qxaj']/div)[1]
${DATE}      19
${MONTH}     November
${YEAR}      2024
${NEXT_Btn}     xpath=//div[@class="r-1loqt21 r-u8s1d r-11xbo3g r-1v2oles r-1otgn73 r-16zfatd r-1i6wzkk r-lrvibr r-184en5c css-1dbjc4n"]

@{MONTHS}=      January    February    March    April   May     June    July    August     September    Ovtober     November    December


*** Keywords ***
Launch SpiceJet Application
    Open Browser        ${URL}      Chrome
    Maximize Browser Window
    Delete All Cookies
    Sleep    3s

Click on FROM and TO
    Input Text    ${FROM}    HYD
    Input Text    ${TO}    BLR

Select Date
  #  Click Element        ${Departure}
    sleep  5s
    ${MonthYear_Value}=      Get Text    ${Month_Year}
    Log To Console    ${MonthYear_Value}

#   FOR    ${month}    IN    @{MONTHS}
#        IF   $month == 'December'
#            Log To Console    CorrectMonth
#            Click Element    ${MonthYear_Value}
#        ELSE
#             Click Element    ${NEXT_Btn}
#        END
#   END
    ${date}   Set Variable   //div[@data-testid="undefined-month-${MONTH}-${YEAR}"]//div[@data-testid="undefined-calendar-day-${DATE}"]
    Click Element    xpath=${date}
#    ${date_val}=    Get Text    ${date}
#    Log To Console    ${date_val}
#    Click Element    ${date}


*** Test Cases ***
SpiceJet Application
    Launch SpiceJet Application
    Click on FROM and TO
    Select Date