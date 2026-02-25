*** Settings ***
Documentation    Keywords specific to Logout functionality
Resource         common_keywords.robot

*** Keywords ***
Open Sidebar Menu
    [Documentation]    Opens the hamburger/sidebar menu
    Wait And Click Element    ${BTN_MENU}
    Wait Until Element Is Visible    ${BTN_LOGOUT}    ${TIMEOUT}

Click Logout
    [Documentation]    Clicks the Logout link in sidebar menu
    Wait Until Element Is Visible    ${BTN_LOGOUT}    ${TIMEOUT}
    Click Element    ${BTN_LOGOUT}

Perform Logout
    [Documentation]    Performs complete logout flow
    Open Sidebar Menu
    Click Logout

Verify User Is Logged Out
    [Documentation]    Verifies user is redirected to login page after logout
    Wait Until Element Is Visible    ${INPUT_USERNAME}    ${TIMEOUT}
    Wait Until Element Is Visible    ${INPUT_PASSWORD}    ${TIMEOUT}
    Wait Until Element Is Visible    ${BTN_LOGIN}    ${TIMEOUT}
    ${current_url}=    Get Location
    Should Contain    ${current_url}    saucedemo.com
