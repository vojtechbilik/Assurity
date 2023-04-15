*** Settings ***
Documentation    API tests for Assurity Interview
Library    Collections
Library    RequestsLibrary


*** Variables ***
${BASE_URL}    https://api.tmsandbox.co.nz


*** Test Cases ***
Test API for Assurity
    [Documentation]    Test case for Assurity metoda Get
    [Tags]    AC1    AC2    AC3

    Status Code Is 200
    Respons Is In Json Format
    Verify If Name Contain Proper Value
    Test If Canrelist Value Is True
    Test If Gallery Contain Text - Good Position In Category


*** Keywords ***
Create API Session
    [Documentation]    In this part creating request session
    [Tags]    API_Session

    Create Session    tmsandbox    ${BASE_URL}
    Set Global Variable    ${SESSION}    tmsandbox
    ${params}    Create Dictionary    catalogue=false
    ${response}    Get On Session    ${SESSION}    /v1/Categories/6327/Details.json\
    ...    params=${params}    expected_status=200
    Set Suite Variable    ${RESPONSE}

    # Part for response header verify

Status Code Is 200
    [Documentation]    Status code of responese is 200
    [Tags]    API_Headers

    Create API Session
    ${status_code}    Convert To String    ${RESPONSE.status_code}
    Should Be Equal    ${status_code}    200

Respons Is In Json Format
    [Documentation]    Response format is Json
    [Tags]    API_Headers

    Create API Session
    ${contentTypeValue}    Get From Dictionary    ${RESPONSE.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json

    # Part wher is verify response body values

Verify If Name Contain Proper Value
    [Documentation]    Verify if response name is Carbon credits
    [Tags]    API_Body    AC1

    Create API Session
    ${body_content}    Convert To String    ${RESPONSE.content}
    Should Contain    ${body_content}    Carbon credits

Test If Canrelist Value Is True
    [Documentation]    Assertion if CanRelist is on value true
    [Tags]    API_Body    AC2

    Create API Session
    ${json_data}    Set Variable    ${RESPONSE.json()}
    Should Be True    ${json_data['CanRelist']}

Test If Gallery Contain Text - Good Position In Category
    [Documentation]    Check if Category Gallery contain element Description Good position in category
    [Tags]    API_Body    AC3

    ${json_data}    Set Variable    ${RESPONSE.json()}
    ${promotions}    Set Variable    ${json_data['Promotions']}
    ${gallery_promotion}    Set Variable    ${EMPTY}
    FOR    ${promotion}    IN    @{promotions}
        IF    '${promotion['Name']}' == 'Gallery'
            ${gallery_promotion}    Set Variable    ${promotion}
        END
    END
    Should Contain    ${gallery_promotion['Description']}    Good position in category
