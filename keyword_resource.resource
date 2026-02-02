*** Settings ***
Library    Selenium
Library    Collections

*** Keywords ***
Open App In Browser
    Open Browser    https://testautomationpractice.blogspot.com/    Chrome

Close App In Browser
    Close Browser

#Customize Assertion Keyword
Verify Selection Of Radio Button
    [Arguments]     ${radio_button_name}
    Radio Button Should Be Set To    gender     ${radio_button_name}

Verify Selection of Checkbox
    [Arguments]     ${checkbox}
    Checkbox Should Be Selected    ${checkbox}

Verify Selection Of Dropdown List
    [Arguments]     ${dropdown_list}    ${element}
    List Selection Should Be    ${dropdown_list}    ${element}

Verify Selection Of List
    [Arguments]     ${list}    ${label_1}    ${label_2}    ${label_3}
    ${selected_options}=    Get Selected List Labels    ${list}
    ${expected_options}=    Create List     ${label_1}     ${label_2}    ${label_3}

    Lists Should Be Equal    ${selected_options}    ${expected_options}    ignore_order=${TRUE}

Verify Selection Of Date
    [Arguments]    ${datepicker}    ${date}
    ${value}=   Get Value  ${datepicker}
    Log To Console    ${value}
    Should Be Equal    ${value}    ${date}

Verify Selection Of Range Of Days
    [Arguments]    ${datepicker_startdate}    ${datepicker_enddate}
    ${start}    Get Value    ${datepicker_startdate}
    ${end}    Get Value    ${datepicker_enddate}
    Log To Console    Start: ${start} End: ${end}
    ${num_days_statement}=    Get Number Of Days    ${start}    ${end}
    Log To Console    ${num_days_statement}
    Page Should Contain    ${num_days_statement}

Verify File Uploaded
    [Arguments]    ${result}
    Page Should Contain    ${result}
