*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    utils.py
Test Setup   Open App In Browser
Test Teardown   Close App In Browser
Resource    keyword_resource.resource
Resource    automation_website_practice2_Locators.resource
Resource    automation_website_practice2_TestData.resource

*** Test Cases ***
#Test Input
#    Wait Until Element Is Visible    //input[@id = "name"]
#    ${name}=    Get Random Name
#    Input Text    //input[@id = "name"]     ${name}
#    Log To Console    ${name}
#
#    Wait Until Element Is Visible    //input[@id = "email"]
#    Input Text    //input[@id = "email"]     ${email}
#
#    Wait Until Element Is Visible    //input[@id = "phone"]
#    Input Text    //input[@id = "phone"]     ${phone}
#
#    Wait Until Element Is Visible    //textarea[@id = "textarea"]
#    Input Text    //textarea[@id = "textarea"]     ${address}

#Test Radio Buttons
#    Wait Until Element Is Visible    //input[@id="male"]/parent::div
#    Click Element    //input[@id="male"]/parent::div
#    Verify Selection Of Radio Button   male
#
#    Wait Until Element Is Visible    //input[@id="female"]/parent::div
#    Click Element    //input[@id="female"]/parent::div
#    Verify Selection Of Radio Button   female
#
#Test Check Box
#    Wait Until Element Is Visible    ${checkbox_sunday}
#    Select Checkbox     ${checkbox_sunday}
#    Verify Selection Of Checkbox    ${checkbox_sunday}
#
#    Wait Until Element Is Visible    ${checkbox_monday}
#    Select Checkbox     ${checkbox_monday}
#    Verify Selection Of Checkbox    ${checkbox_monday}
#
#    Wait Until Element Is Visible    ${checkbox_saturday}
#    Select Checkbox     ${checkbox_saturday}
#    Verify Selection Of Checkbox    ${checkbox_saturday}
#
#Test Dropdown List
#    Wait Until Element Is Visible    ${dropdown_list}
#    Select From List By Label   ${dropdown_list}    India
#    Verify Selection Of Dropdown List     ${dropdown_list}     India
#
#    Select From List By Label   ${dropdown_list}    Canada
#    Verify Selection Of Dropdown List     ${dropdown_list}     Canada
#
Test List
    Wait Until Element Is Visible    ${color_list}
    Select From List By Label   ${color_list}     ${color_1}
    Select From List By Label   ${color_list}     ${color_2}
    Select From List By Label   ${color_list}     ${color_3}
    ${sorted_list}    Get Sorted List    ${color_1}    ${color_2}    ${color_3}
    Log To Console    ${sorted_list}
    Verify Selection Of List    ${color_list}    ${color_1}    ${color_2}    ${color_3}

#Test Sorted List
#    Wait Until Element Is Visible    ${sorted_list}
#    Select From List By Label   ${sorted_list}     ${animal_1}
#    Select From List By Label   ${sorted_list}     ${animal_2}
#    Select From List By Label   ${sorted_list}     ${animal_3}
#
#    Verify Selection Of List    ${sorted_list}   ${animal_3}    ${animal_2}    ${animal_1}
#
#Test Datepicker1
#    Wait Until Element Is Visible    ${datepicker1}
#    Click Element    ${datepicker1}
#    Click Element    xpath=//table[@class = "ui-datepicker-calendar"]//tr[4]//td[4]
#    Verify Selection Of Date    ${datepicker1}    ${date1}
#
#
#Test Datepicker2
#    Wait Until Element Is Visible    ${datepicker2}
#    Click Element    ${datepicker2}
#    Select From List By Label    xpath=//select[@aria-label="Select month"]    Feb
#    Click Element    xpath=//table[@class="ui-datepicker-calendar"]//tr[2]//td[5]
#    Verify Selection Of Date    ${datepicker2}    ${date2}
#
#Test Range Datepicker
#    Wait Until Element Is Visible    ${datepicker_startdate}
#    Input Text    ${datepicker_startdate}    ${date2}
#
#    Wait Until Element Is Visible    ${datepicker_enddate}
#    Input Text    ${datepicker_enddate}    ${date3}
#    Click Button    ${submit_button}
#    Verify Selection Of Range Of Days    ${datepicker_startdate}    ${datepicker_enddate}
#
#Test Single File Upload
#    Wait Until Element Is Visible    ${single_file_upload}
#    Choose File    ${single_file_upload}    ${single_file}
#    Click Button    ${upload_single_file_button}
#    Verify File Uploaded    Single file selected:

#Test Multiple File Upload
#    Wait Until Element Is Visible    ${multiple_file_upload}
#    Choose File    ${multiple_file_upload}    ${multiple_files}
#    Click Button    ${upload_multiple_file_button}
#    Verify File Uploaded    Multiple files selected:













