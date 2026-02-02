*** Settings ***
Library    Selenium
Library    Collections
*** Variables ***
@{list1}=    a    b    c    d    e
*** Keywords ***

*** Test Cases ***
Test List
    #Log list into the log file
    Log To Console    ${list1}
    Log List    ${list1}    level=INFO

    #count number of matches
    ${count_match}=    Get Match Count    ${list1}    a
    Log To Console    Number of Matches ${count_match}

    #Slice the list using indexes
    #last index is excluded
    ${slice}=    Get Slice From List    ${list1}    0    2
    Log To Console    ${slice}

    ${slice}=    Get Slice From List    ${list1}    2    None
    Log To Console    ${slice}

    #List Should Contain Value - if not contain test fails
    List Should Contain Value    ${list1}    a

    #Get From List
    ${value}=    Get From List    ${list1}    4
    Log To Console    Got From List ${value}

    #Get Index From List
    ${value}=    Get Index From List    ${list1}    e
    Log To Console    Got Index From List ${value}

    #Count Values In List
    ${value}=    Count Values In List    ${list1}    e
    Log To Console    Number of Occurrences ${value}

    #Should Not Contain Duplicate - if duplicate found test fails
    List Should Not Contain Duplicates    ${list1}

    @{x}=   create List    1    2    3
    @{y}=   create List    10    20    30

    ${result}=    Combine Lists    ${x}    ${y}
    Log To Console    Combined List ${result}

    #Covert To List
    ${value}=   Convert To List    Any Value
    Log To Console    ${value}

    #Reverse List
    Reverse List    ${list1}
    Log To Console    Reversed List ${list1}