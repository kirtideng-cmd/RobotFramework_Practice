*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${char_1}=    Set Variable    41

*** Keywords ***
Hello World
    Log To Console    Hello World
Open Google Browser
    Open Browser    https://www.makemytrip.com/    Chrome

*** Test Cases ***
#Test
    #Hello World

Test1
    #1
    Open Google Browser
    Wait Until Element Is Visible    xpath://*[@id="top-banner"]/div[2]/div/div/div/div/div/div[2]/div[2]/div[1]/div[1]/div

    #2
    Wait Until Element Is Visible    xpath://*[@id="top-banner"]/div[2]/div/div/div/div/div/div[2]/p/a

    #3
    Wait Until Element Is Visible    xpath://*[@id="header-container"]/div[2]/div/div/nav/ul/li[1]/span/a

    #4
    Wait Until Element Is Visible    xpath://*[@id="header-container"]/div[1]/ul/li[5]/div[1]/span

    #5
    Wait Until Element Is Visible    xpath:/html/body/div[1]/div/div[1]/div[1]/div[2]/div[2]/div/section/form

Test2
    #1
    Element Text Should Be    xpath://*[@id="top-banner"]/div[2]/div/main/main/div[1]/div[1]/span[2]    Explore More

    #2
    Element Should Be Disabled    xpath://*[@id="header-container"]/div[2]/div[2]/div/section/form/div[2]/button

    #3 - Error Button not found
    #Click Button    xpath:/html/body/div[1]/div/div[2]/div/div/div/div/div/div[2]/div[2]/div[2]/button

    #4
    Page Should Contain Image    xpath://img[@src='https://promos.makemytrip.com/Growth/Images/1x/mmt_dt_top_icon.png']

    #5
    ${count}=    Get Element Count    xpath://h2
    Log To Console    ${count}

Test3
    Click Element    xpath=//span[@data-cy = "closeModal" and @class = "commonModal__close"]
    Click Element    xpath=//span[@class = "headerIconTextAlignment chNavText darkGreyText" and text() = "Hotels"]
    Wait Until Element Is Visible    xpath=//li[@class = "grpBkngOpt__item selected"]//following::span[contains(@class, "item--opt")]
    Wait Until Element Is Visible    xpath=//h1[@data-cy="HotelSearchWidget_310"]//following::a[text()="Domestic"]
    Wait Until Element Is Visible    xpath=//h1[@data-cy="HotelSearchWidget_310"]//following::a[text()="International"]
    Wait Until Element Is Visible    xpath=//h1[@data-cy="HotelSearchWidget_310"]//following::a[text()="click here"]
