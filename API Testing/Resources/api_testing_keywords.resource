*** Settings ***

*** Variables ***

*** Keywords ***
Get Users And Verify Status Code
    [documentation]    This keywords gets all users from the site and verify the status code of the request
    ${response}=    Get On Session    mysession    ${users_endpoint}
    Log To Console    Response: ${response}
    Status Should Be    ${okay_status}    ${response}

Get User By Name
    [documentation]    This keyword return a user with specified name
    [arguments]    ${name}
    ${response}=    Get On Session    mysession    ${users_endpoint}    params=name=${name}
    Log To Console    ${response.text}

Get First N Posts
    [documentation]    This keyword returns first N posts
    [arguments]    ${number_of_posts}

    ${response}=    Get On Session    mysession    ${posts_endpoint}    params=limit=${number_of_posts}
    ${flag}=    Run Keyword And Return Status    Status Should Be    ${okay_status}    ${response}
    IF    ${flag}
        Log To Console    ${response.json()}
    ELSE
        Log To Console    No Posts Found!
    END

Do A Post Request For Create User
    [documentation]    This is used to do a post request for users and verify status code, body and content type
    [arguments]    ${body}
    &{header}=    Create Dictionary    Cache-Control=no-cache
    ${response}=    Post On Session    mysession    ${users_endpoint}    json=${body}    headers=${header}
    Status Should Be    ${create_status}    ${response}
    Should Be Equal As Strings    ${response.json()['name']}    ${body['name']}
    Should Be Equal As Strings    ${response.json()['username']}    ${body['username']}
    Should Be Equal As Strings    ${response.json()['email']}    ${body['email']}

Update Username And Verify Status Code
    [documentation]    This is used to update a field of user
    [arguments]    ${body}

    ${body['username']}    Set Variable    Updated Username
    ${response}=    Put On Session    mysession    ${users_endpoint}/9    json=${body}

    Status Should Be    ${okay_status}    ${response}

#    Should Be Equal As Strings    ${response.json()['name']}    ${body['name']}
#    Should Be Equal As Strings    ${response.json()['username']}    ${body['username']}

Delete User By Id
    [documentation]    This keyword deletes the user with particular id
    [arguments]    ${id}

    ${response}=    Delete On Session    mysession    ${users_endpoint}/${id}
    Status Should Be    ${okay_status}    ${response}

Partially Update Username And Verify Status Code
    [documentation]    This is used to update a field of user

    &{updates}=    Create Dictionary    username=Updated username
    ${response}=    Patch On Session    mysession    ${users_endpoint}/9    json=${updates}

    Status Should Be    ${okay_status}    ${response}