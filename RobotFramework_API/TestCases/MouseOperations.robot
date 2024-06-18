*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${Var_DoubleClick}      xpath=//button[text()='Copy Text']
${Var_RightClick}       xpath=//span[text()='right click me']
${source}               id=draggable
${Target}               id=droppable


*** Test Cases ***
MouseActions
    #DoubleClick
    Open Browser   https://testautomationpractice.blogspot.com/       Chrome
    Maximize Browser Window
    Double Click Element    ${Var_DoubleClick}
    Sleep    3

    #RightClick
    Go To    https://demo.guru99.com/test/simple_context_menu.html
    Maximize Browser Window
    Open Context Menu    ${Var_RightClick}
    Sleep    3
    
    #DragandDrop
    Go To    https://jqueryui.com/droppable/
    Maximize Browser Window
    Select Frame    xpath=//iframe[@class="demo-frame"]
    Sleep    5
    Drag And Drop    ${source}    ${Target}
    Sleep    7
    Close Browser

