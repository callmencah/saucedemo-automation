*** Settings ***
Documentation    Keywords specific to Checkout flow
Resource         common_keywords.robot

*** Keywords ***
Click Checkout Button
    [Documentation]    Clicks the Checkout button on cart page
    Wait And Click Element    ${BTN_CHECKOUT}

Fill Checkout Information
    [Documentation]    Fills in the checkout form with provided data
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait And Input Text    ${INPUT_FIRST_NAME}    ${first_name}
    Wait And Input Text    ${INPUT_LAST_NAME}    ${last_name}
    Wait And Input Text    ${INPUT_POSTAL_CODE}    ${postal_code}

Fill Valid Checkout Information
    [Documentation]    Fills checkout form with default valid data
    Fill Checkout Information    ${FIRST_NAME}    ${LAST_NAME}    ${POSTAL_CODE}

Click Continue Button
    [Documentation]    Clicks Continue on checkout step one
    Wait And Click Element    ${BTN_CONTINUE}

Click Finish Button
    [Documentation]    Clicks Finish to complete checkout
    Wait And Click Element    ${BTN_FINISH}

Verify Checkout Step One
    [Documentation]    Verifies user is on checkout step one (Your Information)
    Wait And Verify Text    ${PRODUCTS_TITLE}    ${CHECKOUT_STEP_ONE_TITLE}

Verify Checkout Step Two
    [Documentation]    Verifies user is on checkout step two (Overview)
    Wait And Verify Text    ${PRODUCTS_TITLE}    ${CHECKOUT_STEP_TWO_TITLE}

Verify Checkout Complete
    [Documentation]    Verifies the checkout complete page is displayed
    Wait And Verify Text    ${CHECKOUT_COMPLETE_TITLE}    ${CHECKOUT_COMPLETE_HEADER}

Verify Checkout Error
    [Documentation]    Verifies checkout error message
    [Arguments]    ${expected_error}
    Wait And Verify Text    ${CHECKOUT_ERROR}    ${expected_error}

Complete Full Checkout Flow
    [Documentation]    Performs complete checkout with valid data
    Click Checkout Button
    Verify Checkout Step One
    Fill Valid Checkout Information
    Click Continue Button
    Verify Checkout Step Two
    Click Finish Button
    Verify Checkout Complete
