*** Settings ***
Library    Selenium
Library    Collections

*** Variables ***
&{dict}=    name=User    role=tester    salary=50000

*** Keywords ***


*** Test Cases ***
Test Dictionary
    Log To Console    Before: ${dict}

    #Set To Dictionary - add or update items in dictionary
    Set To Dictionary    ${dict}    role=Automation Tester
    Log To Console    After: ${dict}

    Set To Dictionary    ${dict}    experience=1 Year
    Log To Console    After Adding New Item: ${dict}

    #Remove From Dictionary - it does NOT gives error if key doesn't exist!
    Remove From Dictionary    ${dict}    phone

    #Pop From Dictionary
    Pop From Dictionary    ${dict}    experience
    Log To Console    After poping element from dictionary: ${dict}

    #Keep In Dictionary
    Keep In Dictionary    ${dict}    name    role
    Log To Console    After keeping element in dictionary: ${dict}

    #Get From Dictionary
    ${name}    Get From Dictionary    ${dict}    name
    Log To Console    Name: ${name}

    #Get Dictionary Values
    ${values}=    Get Dictionary Values    ${dict}
    Log To Console    Values in Dictionary: ${values}

    #Get Dictionary Keys
    ${keys}=    Get Dictionary Keys    ${dict}
    Log To Console    Keys in Dictionary: ${keys}

    #Get Dictionary Items
    ${items}=    Get Dictionary Items    ${dict}
    Log To Console    Items in Dictionary: ${items}

    #Dictionary Should Not Contain Value
    Dictionary Should Not Contain Value    ${dict}    Helper

    #Dictionary Should Contain Value
    Dictionary Should Contain Value    ${dict}    User