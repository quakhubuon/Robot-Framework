*** Settings ***
Library           SeleniumLibrary           

*** Keywords ***

Opening Browser
    [Arguments]    ${URL}    ${BROWSER}    
    Open Browser    ${URL}    ${BROWSER}
    Sleep    3s
    
Closing Browser
    Close Browser

Inputing username
    [Arguments]    ${Username}
    Input Text    xpath=//input[@name='user_email']    ${Username}

Inputing password
    [Arguments]    ${Password}
    Input Text    xpath=//input[@name='user_password']    ${Password}

Click login button
    Click Button    xpath=//button[contains(text(), 'Login')]

Verify login success
    Page Should Contain    Hello
    Click Element    xpath=//button[@class="btn btn-sm btn-light dropdown-toggle"]
    Click Element    xpath=//div[@class="dropdown-menu dropdown-menu-right show"]
    Sleep    3s

Verify login failure
    Page Should Contain Button    xpath=//button[contains(text(), 'Login')]
    Clear Element Text    xpath=//input[@name='user_email']
    Clear Element Text    xpath=//input[@name='user_password']
    Sleep    3s
    
Verify login valid
    Page Should Not Contain Element    xpath=//button[@class='btn btn-primary px-3']
    Go to    http://localhost/Laravel/
    
Verify login invalid
    Page Should Contain Element    xpath=//button[@class='btn btn-primary px-3']
    Go to    http://localhost/Laravel/

Click detail 
    Click Element    xpath=//a[@name='detail'] 

Inputing quantity
    [Arguments]    ${Quantity}
    Input Text      xpath=//input[@name='cart_quantity']    ${Quantity}

Click AddToCart
    Click Button    xpath=//button[@class='btn btn-primary px-3']