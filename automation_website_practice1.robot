*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${char_1}=    Set Variable    41

*** Keywords ***
Hello World
    Log To Console    Hello World
Open App In Browser
    Open Browser    https://practicetestautomation.com/practice-test-login/    Chrome
Close App In Browser
    Close Browser

*** Test Cases ***

Test_Positive
    Open App In Browser
    Input Text    xpath=//input[@name="username"]    student
    Input Text    xpath=//input[@name="password"]    Password123
    Click Element    xpath=//button[@id="submit"]
    Page Should Contain    Logged In Successfully
    Page Should Contain Element    xpath=//a[text()="Log out"]
    Close App In Browser

Test_Negative_Username
    Open App In Browser
    Input Text    xpath=//input[@name="username"]    incorrect_username
    Input Text    xpath=//input[@name="password"]    Password123
    Click Element    xpath=//button[@id="submit"]
    Page Should Contain Element    xpath=//div[@id = "error"]
    Wait Until Page Contains     Your username is invalid!
    Close App In Browser
Test_Negative_Password
    Open App In Browser
    Input Text    xpath=//input[@name="username"]    student
    Input Text    xpath=//input[@name="password"]    incorrect_password
    Click Element    xpath=//button[@id="submit"]
    Page Should Contain Element    xpath=//div[@id = "error"]
    Wait Until Page Contains     Your username is invalid!
    Close App In Browser

