*** Settings ***
Library    String
Library    DateTime
Library    SeleniumLibrary
*** Variables ***
@{tag_id}    fromCity    toCity
*** Keywords ***
Open Website In Browser
    Set Selenium Speed    0.2s
    Open Browser    ${website_url}    Chrome
    Maximize Browser Window

Close Popup
    #Click Element    ${popup_close2}
    Wait Until Element Is Visible    ${popup_close}
    Click Element    ${popup_close}

    Wait Until Element Is Visible    ${robot_popup_close}
    Click Element    ${robot_popup_close}
    Wait Until Page Does Not Contain Element    ${robot_popup_close}

Click On Buses Icon
    [documentation]    Clicks on buses icon
    Wait Until Element Is Visible    ${bus_icon}    10s
    Click Element    ${bus_icon}

Select From City
    [Arguments]    ${data}
    ${input}=    Replace String    ${input_tags}    replace    ${tag_id[0]}
    Wait Until Element Is Visible    ${input}    10s
    Click Element    ${input}

    Wait Until Element Is Visible    ${fromCity_input}    10s

    Press Keys    ${fromCity_input}    ${data}[from]
    Press Keys    ${fromCity_input}    ARROW_DOWN
    Press Keys    ${fromCity_input}    ENTER

Select To City
    [Arguments]    ${data}

    Wait Until Element Is Visible    ${toCity_input}    10s

    Press Keys    ${toCity_input}    ${data}[to]
    Press Keys    ${toCity_input}    ARROW_DOWN
    Press Keys    ${toCity_input}    ENTER

Select Travel Date
    [Arguments]    ${date}
    Log To Console    Date format:${date}
    Wait Until Element Is Visible    ${travel_date}    10s
    ${element_date}    Replace String    ${actual_date_element}    date    ${date}
    Execute JavaScript    window.scrollBy(0, 250)
    Execute JavaScript    document.querySelector('textarea.tp-dt-enhanced-input-box').style.display='none'
    FOR    ${ele}    IN RANGE    3
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${element_date}
        Log To Console    ${status} and ${element_date}
        IF    ${status}
            Scroll Element Into View    ${element_date}
            sleep    2s
            Click Element    ${element_date}
            Log To Console    Date found and clicked!
            Exit For Loop
        ELSE
            Click Element    ${next_month_button}
        END
    END
    Execute JavaScript    window.scrollBy(0, -250)

Validate Cities And Proceed With Travel Date
    [Arguments]    ${data}    ${status}
    IF    not ${status}
        Log To Console    Same cities are selected!
    ELSE
        ${current_date}=    Get Text   ${travel_date}
        Log To Console    Current Date is ${current_date}
        ${date}=    Get Random Date    ${current_date}
        Set To Dictionary    ${data}    travel_date=${date}
        Select Travel Date    ${date}
        Verification Of Travel Date    ${data}
        Click Search Button
        Set To Dictionary    ${data}    travel_date=${date}
        Wait Until Keyword Succeeds    3x    2s    Verification Of Details After Redirection To Next Page    ${data}
    END
Click Search Button
    Wait Until Element Is Visible    ${search_button}
    Click Element    ${search button}

Select Bus Seat
    Wait Until Element Is Visible    ${bus_select_seat_button}
    Click Element    ${bus_select_seat_button}
    Wait Until Element Is Visible    ${bus_seat_image}
    Click Element    ${bus_seat_image}

Select Pickup Drop Location And Continue
    Wait Until Element Is Visible    ${pickup}
    Click Element    ${pickup}
    Wait Until Element Is Visible    ${drop}
    Click Element    ${drop}
    Wait Until element Is Visible    ${continue_button}
    Click Element    ${continue_button}

#Assertion Keywords
Verification Of Redirection To Buses Module
    [documentation]    Verifies whether user redirect to buses module after clicking bus icon
    Location Should Be    ${buses_module_url}

Verification Of Selection Of Fromcity
    [Arguments]    ${data}
    ${path}=    Replace String    ${input_tags}    replace    fromCity
    ${value}    Get Value    ${path}
    Should Contain    ${value}    ${data}[from]
    Log To Console    Verification: From City - ${value}

Verification Of Selection Of Tocity
    [Arguments]    ${data}
    ${path}=    Replace String    ${input_tags}    replace    toCity
    ${value}    Get Value    ${path}
    Should Contain    ${value}    ${data}[to]
    Log To Console    Verification: To City - ${value}

Verification For Cities Selection
    [Arguments]    ${data}
    ${path}=    Replace String    ${input_tags}    replace    ${tag_id[0]}
    ${from_value}    Get Value    ${path}
    ${path}=    Replace String    ${input_tags}    replace    ${tag_id[1]}
    ${to_value}    Get Value    ${path}

    ${status}=    Run Keyword And Return Status    Should Be Equal    ${from_value}    ${to_value}
    IF    ${status}
        Page Should Contain Element    ${same_city_error_msg}
        RETURN    False
    ELSE
        Should Contain    ${to_value}    ${data}[to]
        Should Contain    ${from_value}    ${data}[from]
        RETURN    True
    END

Verification of Travel Date
    [Arguments]    ${data}
    ${value}=    Get Text    ${travel_date}
    ${ui_norm}=    Convert Date    ${value}    result_format=%Y-%m-%d    date_format=%d %b%y
    ${excel_norm}=     Convert Date    ${data}[travel_date]   date_format=%b %d %Y    result_format=%Y-%m-%d
    Should Be Equal    ${ui_norm}    ${excel_norm}
    Log To Console   Verification: Travel Date: ${value}

Verification Of Details After Redirection To Next Page
    [Arguments]    ${data}
    ${from}=    Get Text    ${from_city_page_2}
    ${to}=    Get Text    ${to_city_page_2}
    ${departure}    Get Text    ${depart_page_2}
    ${page2_heading}    Get Text    ${heading_page_2}
    ${heading}    Get Page2 Heading    ${from}    ${to}

    Should Be Equal    ${page2_heading}    ${heading}
    Should Contain    ${from}    ${data}[from]
    Should Contain    ${to}    ${data}[to]

    ${ui_norm}=    Convert Date    ${departure}    result_format=%Y-%m-%d    date_format=%a, %d %b %Y
    ${data_norm}=     Convert Date    ${data}[travel_date]   date_format=%b %d %Y    result_format=%Y-%m-%d

Verification Of Details After Redirection To Page3
    [documentation]    Here we verify whether details from page 2 matches with details with page 3
    [Arguments]    ${busname}    ${bus-price}
    ${busname1}    Get Text    ${bus_name}
    ${bus_price1}    Get Text    ${bus_price}

    Should Be Equal    ${busname}    ${busname1}
    Should Be Equal    ${bus_price}    ${bus_price1}