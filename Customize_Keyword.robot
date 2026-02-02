*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${char_1}=    Set Variable    41

#Test Data
${username}=    student
${password}=    Password123
${incorrect_username}=    incorrect_student
${incorrect_password}=    incorrect_Password123

#Locators


*** Keywords ***
Hello World
    Log To Console    Hello World
Open App In Browser
    Open Browser    https://practicetestautomation.com/practice-test-login/    Chrome
Close App In Browser
    Close Browser
Enter Username and Password and Click Log In Button
    [documentation]     This keyword - Enter username and password and clicks on log in button
    [Arguments]     ${username}     ${password}
    Input Text    xpath=//input[@name="username"]    ${username}
    Input Text    xpath=//input[@name="password"]    ${password}
    Click Element    xpath=//button[@id="submit"]
*** Test Cases ***

Test_Positive
    Open App In Browser
    Enter Username and Password and Click Log In Button     ${username}     ${password}
    Page Should Contain    Logged In Successfully
    Page Should Contain Element    xpath=//a[text()="Log out"]
    Close App In Browser

Test_Negative_Username
    Open App In Browser
    Enter Username and Password and Click Log In Button     ${incorrect_username}     ${password}
    Page Should Contain Element    xpath=//div[@id = "error"]
    Wait Until Page Contains     Your username is invalid!
    Close App In Browser
Test_Negative_Password
    Open App In Browser
    Enter Username and Password and Click Log In Button     ${username}     ${incorrect_password}
    Page Should Contain Element    xpath=//div[@id = "error"]
    Wait Until Page Contains     Your username is invalid!
    Close App In Browser