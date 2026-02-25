*** Settings ***
Documentation    Test Suite: Login Feature
...              Validates login functionality with valid and invalid credentials
Resource         ../resources/keywords/login_keywords.robot
Resource         ../resources/keywords/common_keywords.robot
Test Setup       Open Browser To SauceDemo
Test Teardown    Close Test Browser

*** Test Cases ***
TC-LOGIN-001: Login With Valid Credentials Should Redirect To Products Page
    [Documentation]    Verify user can login with valid credentials
    ...                and is redirected to the Products page
    [Tags]    login    positive    smoke    critical
    Login With Valid Credentials
    Verify Successful Login
    ${current_url}=    Get Location
    Should Contain    ${current_url}    inventory

TC-LOGIN-002: Login With Invalid Credentials Should Show Error Message
    [Documentation]    Verify error message is displayed when
    ...                logging in with invalid credentials
    [Tags]    login    negative    critical
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Error Message    ${ERROR_INVALID_LOGIN}

TC-LOGIN-003: Login With Locked Out User Should Show Error Message
    [Documentation]    Verify error message for locked out user
    [Tags]    login    negative    high
    Login With Credentials    ${LOCKED_USERNAME}    ${VALID_PASSWORD}
    Verify Login Error Message    ${ERROR_LOCKED_USER}

TC-LOGIN-004: Login With Empty Username Should Show Error Message
    [Documentation]    Verify error message when username is empty
    [Tags]    login    negative    medium
    Login With Credentials    ${EMPTY}    ${VALID_PASSWORD}
    Verify Login Error Message    ${ERROR_EMPTY_USERNAME}

TC-LOGIN-005: Login With Empty Password Should Show Error Message
    [Documentation]    Verify error message when password is empty
    [Tags]    login    negative    medium
    Login With Credentials    ${VALID_USERNAME}    ${EMPTY}
    Verify Login Error Message    ${ERROR_EMPTY_PASSWORD}
