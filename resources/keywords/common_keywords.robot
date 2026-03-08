*** Settings ***
Documentation    Common reusable keywords for all test suites
Library          SeleniumLibrary
Resource         ../locators/locators.robot
Resource         ../test_data/test_data.robot

*** Keywords ***
Open Browser To SauceDemo
    [Documentation]    Opens Chrome browser and navigates to SauceDemo
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --no-default-browser-check
    Call Method    ${chrome_options}    add_experimental_option    excludeSwitches    ${{["enable-automation"]}}
    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}    profile.password_manager_leak_detection=${False}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Run Keyword If    '${BROWSER}' == 'headlesschrome'    Call Method    ${chrome_options}    add_argument    --headless=new
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${BASE_URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}

Close Test Browser
    [Documentation]    Closes the browser after test execution
    Close All Browsers

Wait And Click Element
    [Documentation]    Waits for element to be visible then clicks
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Click Element    ${locator}

Wait And Input Text
    [Documentation]    Waits for element to be visible then inputs text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Input Text    ${locator}    ${text}

Wait And Verify Text
    [Documentation]    Waits for element and verifies its text content
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Element Text Should Be    ${locator}    ${expected_text}

Wait And Verify Element Contains
    [Documentation]    Waits for element and verifies it contains text
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Element Should Contain    ${locator}    ${expected_text}

Verify Element Is Visible
    [Documentation]    Verifies that an element is visible on the page
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

Verify Page Contains Element
    [Documentation]    Verifies the page contains the specified element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    ${TIMEOUT}

Get Element Count On Page
    [Documentation]    Returns the count of elements matching the locator
    [Arguments]    ${locator}
    ${count}=    Get Element Count    ${locator}
    RETURN    ${count}
