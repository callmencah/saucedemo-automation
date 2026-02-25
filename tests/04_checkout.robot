*** Settings ***
Documentation    Test Suite: Checkout Flow
...              Validates the complete checkout process including error handling
Resource         ../resources/keywords/login_keywords.robot
Resource         ../resources/keywords/cart_keywords.robot
Resource         ../resources/keywords/checkout_keywords.robot
Resource         ../resources/keywords/common_keywords.robot
Test Setup       Setup Cart With Product
Test Teardown    Close Test Browser

*** Keywords ***
Setup Cart With Product
    [Documentation]    Login and add a product to cart as prerequisite
    Perform Valid Login
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Navigate To Cart
    Verify Cart Page Is Displayed

*** Test Cases ***
TC-CHECKOUT-001: Complete Checkout With Valid Data
    [Documentation]    Verify complete checkout flow with valid information
    ...                from cart to confirmation page
    [Tags]    checkout    positive    critical    smoke
    Complete Full Checkout Flow

TC-CHECKOUT-002: Checkout Error When First Name Is Empty
    [Documentation]    Verify error when first name is not filled
    [Tags]    checkout    negative    high
    Click Checkout Button
    Verify Checkout Step One
    Fill Checkout Information    ${EMPTY}    ${LAST_NAME}    ${POSTAL_CODE}
    Click Continue Button
    Verify Checkout Error    ${ERROR_FIRST_NAME_REQ}

TC-CHECKOUT-003: Checkout Error When Last Name Is Empty
    [Documentation]    Verify error when last name is not filled
    [Tags]    checkout    negative    high
    Click Checkout Button
    Verify Checkout Step One
    Fill Checkout Information    ${FIRST_NAME}    ${EMPTY}    ${POSTAL_CODE}
    Click Continue Button
    Verify Checkout Error    ${ERROR_LAST_NAME_REQ}

TC-CHECKOUT-004: Checkout Error When Postal Code Is Empty
    [Documentation]    Verify error when postal code is not filled
    [Tags]    checkout    negative    high
    Click Checkout Button
    Verify Checkout Step One
    Fill Checkout Information    ${FIRST_NAME}    ${LAST_NAME}    ${EMPTY}
    Click Continue Button
    Verify Checkout Error    ${ERROR_POSTAL_CODE_REQ}

TC-CHECKOUT-005: Checkout Error When All Fields Are Empty
    [Documentation]    Verify error when all checkout fields are empty
    [Tags]    checkout    negative    medium
    Click Checkout Button
    Verify Checkout Step One
    Click Continue Button
    Verify Checkout Error    ${ERROR_FIRST_NAME_REQ}

TC-CHECKOUT-006: Verify Checkout Overview Page Shows Product
    [Documentation]    Verify product info is displayed on checkout overview
    [Tags]    checkout    positive    high
    Click Checkout Button
    Fill Valid Checkout Information
    Click Continue Button
    Verify Checkout Step Two
    Page Should Contain    ${PRODUCT_1_NAME}
