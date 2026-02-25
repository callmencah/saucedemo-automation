*** Settings ***
Documentation    Test Suite: Logout
...              Validates logout functionality from the application
Resource         ../resources/keywords/login_keywords.robot
Resource         ../resources/keywords/logout_keywords.robot
Resource         ../resources/keywords/common_keywords.robot
Test Setup       Perform Valid Login
Test Teardown    Close Test Browser

*** Test Cases ***
TC-LOGOUT-001: Logout Should Redirect To Login Page
    [Documentation]    Verify user is redirected to login page after logout
    [Tags]    logout    positive    critical    smoke
    Perform Logout
    Verify User Is Logged Out

TC-LOGOUT-002: Login Page Elements Visible After Logout
    [Documentation]    Verify all login page elements are visible after logout
    [Tags]    logout    positive    high
    Perform Logout
    User Should Be On Login Page
