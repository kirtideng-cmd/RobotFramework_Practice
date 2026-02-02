*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

Resource    ../Resources/api_testing_keywords.resource

Variables    ../config/environment.py

Test Setup    Create Session    mysession    ${base_url}    verify=true
*** Variables ***
${name}=    Glenna Reichert
${number_of_posts}=    1
${id}=    9
*** Test Cases ***
Test For API Testing
    &{body}=    Create Dictionary    id=12    name=Test User1    username=TestU1    email=testuser1@gmail.com
    &{existing_user_body}     Create Dictionary    id=9    name=Glenna Reichert    username=Delphine    email=Chaim_McDermott@dana.io
    Get Users And Verify Status Code
    Get User By Name    ${name}
    Get First N Posts    ${number_of_posts}
    Do A Post Request For Create User    ${body}
    Update Username And Verify Status Code    ${existing_user_body}
    Delete User By Id    ${id}
    Partially Update Username And Verify Status Code