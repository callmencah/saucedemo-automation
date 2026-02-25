*** Settings ***
Documentation    Keywords specific to Login functionality
Resource         common_keywords.robot

*** Keywords ***
Login With Credentials
    [Documentation]    Logs in with provided username and password
    [Arguments]    ${username}    ${password}
    Wait And Input Text    ${INPUT_USERNAME}    ${username}
    Wait And Input Text    ${INPUT_PASSWORD}    ${password}
    Wait And Click Element    ${BTN_LOGIN}

Login With Valid Credentials
    [Documentation]    Logs in with the standard valid credentials
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}

Verify Successful Login
    [Documentation]    Verifies that login was successful by checking Products page
    Wait And Verify Text    ${PRODUCTS_TITLE}    ${PRODUCTS_PAGE_TITLE}

Verify Login Error Message
    [Documentation]    Verifies the error message displayed on failed login
    [Arguments]    ${expected_error}
    Wait And Verify Text    ${ERROR_MESSAGE}    ${expected_error}

User Should Be On Login Page
    [Documentation]    Verifies user is on the login page
    Verify Element Is Visible    ${INPUT_USERNAME}
    Verify Element Is Visible    ${INPUT_PASSWORD}
    Verify Element Is Visible    ${BTN_LOGIN}

Perform Valid Login
    [Documentation]    Performs complete login flow with valid credentials
    Open Browser To SauceDemo
    Login With Valid Credentials
    Verify Successful Login
