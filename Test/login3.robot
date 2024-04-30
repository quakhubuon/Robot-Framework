*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Data/dataFile.xlsx    sheet_name=Sheet1

Resource          ../Resources/Resources.robot

Suite Setup    Resources.Opening Browser    http://localhost/Laravel/user    Firefox
Test Template     Test Login 
Suite Teardown    Resources.Closing Browser

*** Test Cases ***
LoginTestUsingExcel    ${Username}    ${Password}    ${ExpectedResult}

*** Keywords ***
Test login 
    [Arguments]    ${Username}    ${Password}    ${ExpectedResult}
    Inputing username    ${Username}
    Inputing password    ${Password}
    Click login button 
    Run Keyword If    '${ExpectedResult}' == 'Success'    Verify login success
    Run Keyword If    '${ExpectedResult}' == 'Failure'    Verify login failure