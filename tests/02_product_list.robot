*** Settings ***
Documentation    Test Suite: Product List Page
...              Validates product listing functionality after successful login
Resource         ../resources/keywords/login_keywords.robot
Resource         ../resources/keywords/product_keywords.robot
Resource         ../resources/keywords/common_keywords.robot
Test Setup       Perform Valid Login
Test Teardown    Close Test Browser

*** Test Cases ***
TC-PRODUCT-001: Products Page Should Be Displayed After Login
    [Documentation]    Verify the Products page title is displayed
    ...                after successful login
    [Tags]    products    positive    smoke
    Verify Products Page Is Displayed

TC-PRODUCT-002: Product List Should Not Be Empty
    [Documentation]    Verify that at least one product is displayed
    [Tags]    products    positive    critical
    Verify Product List Is Not Empty

TC-PRODUCT-003: Products Should Display Name Price And Add To Cart
    [Documentation]    Verify each product displays required information:
    ...                product name, price, and Add to Cart button
    [Tags]    products    positive    critical
    Verify Products Have Required Info

TC-PRODUCT-004: Known Products Should Be Present In The List
    [Documentation]    Verify specific known products are displayed
    [Tags]    products    positive    high
    Verify Product Name Exists    ${PRODUCT_1_NAME}
    Verify Product Name Exists    ${PRODUCT_2_NAME}
    Verify Product Name Exists    ${PRODUCT_3_NAME}

TC-PRODUCT-005: Total Product Count Should Be Six
    [Documentation]    Verify exactly 6 products are displayed on the page
    [Tags]    products    positive    medium
    ${count}=    Get Total Product Count
    Should Be Equal As Integers    ${count}    6
    ...    Expected 6 products but found ${count}
