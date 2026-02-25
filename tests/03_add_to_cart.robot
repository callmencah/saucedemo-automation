*** Settings ***
Documentation    Test Suite: Add to Cart
...              Validates adding products to cart and verifying cart contents
Resource         ../resources/keywords/login_keywords.robot
Resource         ../resources/keywords/cart_keywords.robot
Resource         ../resources/keywords/common_keywords.robot
Test Setup       Perform Valid Login
Test Teardown    Close Test Browser

*** Test Cases ***
TC-CART-001: Add Single Product To Cart
    [Documentation]    Verify adding one product updates cart badge to 1
    [Tags]    cart    positive    critical
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Verify Cart Badge Count    1

TC-CART-002: Add Multiple Products To Cart
    [Documentation]    Verify adding multiple products updates cart badge correctly
    [Tags]    cart    positive    critical
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Add Product To Cart By Name    ${PRODUCT_2_NAME}
    Add Product To Cart By Name    ${PRODUCT_3_NAME}
    Verify Cart Badge Count    3

TC-CART-003: Added Product Should Appear In Cart Page
    [Documentation]    Verify added product is visible in the cart page
    [Tags]    cart    positive    critical
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Navigate To Cart
    Verify Cart Page Is Displayed
    Verify Product In Cart    ${PRODUCT_1_NAME}
    Verify Cart Item Count    1

TC-CART-004: Multiple Added Products Should Appear In Cart Page
    [Documentation]    Verify all added products appear in cart page
    [Tags]    cart    positive    high
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Add Product To Cart By Name    ${PRODUCT_2_NAME}
    Navigate To Cart
    Verify Cart Page Is Displayed
    Verify Product In Cart    ${PRODUCT_1_NAME}
    Verify Product In Cart    ${PRODUCT_2_NAME}
    Verify Cart Item Count    2

TC-CART-005: Remove Product From Cart
    [Documentation]    Verify product can be removed from cart
    [Tags]    cart    positive    high
    Add Product To Cart By Name    ${PRODUCT_1_NAME}
    Add Product To Cart By Name    ${PRODUCT_2_NAME}
    Verify Cart Badge Count    2
    Navigate To Cart
    Remove Product From Cart By Name    ${PRODUCT_1_NAME}
    Verify Cart Item Count    1
    Verify Product In Cart    ${PRODUCT_2_NAME}
