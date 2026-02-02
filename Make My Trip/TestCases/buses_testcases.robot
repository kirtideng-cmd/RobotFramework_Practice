*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ../Resources/utils/utils.py
Resource    ../Resources/busmodule_keywords.resource
Variables    ../environment.py
Variables    ../Page Objects/pageobjects.py

Test Setup    Open Website In Browser
Test Setup    Close Popup
Test TearDown    Close Browser
*** Variables ***
${testDataPath}=    ${EXECDIR}${/}../TestData/buses_module_testdata.xlsx
${id}=    id_1
*** Test Cases ***
Test For Buses Module Flow
    &{data}=    Fetch Testdata By Id    ${testDataPath}    ${id}
    Close Popup
    Click On Buses Icon
    Verification Of Redirection To Buses Module
    Select From City    ${data}
    Select To City    ${data}
    ${status}=    Verification For Cities Selection    ${data}
    Validate Cities And Proceed With Travel Date    ${data}    ${status}





#    ${busname}    Get Text    ${bus_card_busname}
#    ${bus_date}    Get Text    ${bus_card_date}
#    ${bus_price}    Get Text    ${bus_card_price}
#
#    Log To Console    ${busname}    ${bus_date}    ${bus_price}
#
#
#    Select Bus Seat
#    Select Pickup Drop Location And Continue
#
#    Verification Of Details After Redirection To Page3    ${busname}    ${bus_price}
#
#    Wait Until Element Is Visible    ${input_page3}[1]
#    Input Text    ${input_page3}[1]    ${username}
#
#    Wait Until Element Is Visible   ${input_page3}[2]
#    Input Text    ${input_page3}[2]    ${age}
#
#    Wait Until Element Is Visible    ${female_gender_tab_page_3}
#    Click Element    ${female_gender_tab_page_3}
#
#    Wait Until Element Is Visible    ${input_page3}[3]
#    Input Text    ${input_page3}[3]    ${email}
#
#    Wait Until Element Is Visible    ${input_page3}[4]
#    Input Text    ${input_page3}[4]    ${phone}
#
#    Wait Until Element Is Visible    ${confirm_checkbox_page_3}
#    Click Element    ${confirm_checkbox_page_3}