*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Data/dataFile2.xlsx    sheet_name=Sheet1

Resource          ../Resources/Resources.robot

Suite Setup    Resources.Opening Browser    http://localhost/Laravel/    Chrome    
Test Template     Test Cart 
Suite Teardown    Resources.Closing Browser

*** Test Cases ***
CartTestUsingExcel    ${Quantity}    ${ExpectedResult}

*** Keywords ***
Test Cart 
    [Arguments]    ${Quantity}    ${ExpectedResult}
    Click detail 
    Inputing quantity    ${Quantity}
    Click AddToCart 
    Run Keyword If    '${ExpectedResult}' == 'Valid'    Verify login valid
    Run Keyword If    '${ExpectedResult}' == 'Invalid'    Verify login invalid
   