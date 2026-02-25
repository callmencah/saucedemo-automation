*** Settings ***
Documentation    Keywords specific to Cart functionality
Library          String
Resource         common_keywords.robot

*** Keywords ***
Add Product To Cart By Name
    [Documentation]    Adds a product to cart using its name to construct the button ID
    [Arguments]    ${product_name}
    ${formatted_name}=    Convert Product Name To Id    ${product_name}
    Wait And Click Element    id:add-to-cart-${formatted_name}

Convert Product Name To Id
    [Documentation]    Converts product name to lowercase hyphenated format for button ID
    [Arguments]    ${product_name}
    ${lower}=    Convert To Lower Case    ${product_name}
    ${formatted}=    Replace String    ${lower}    ${SPACE}    -
    RETURN    ${formatted}

Verify Cart Badge Count
    [Documentation]    Verifies the cart badge shows the expected item count
    [Arguments]    ${expected_count}
    Wait And Verify Text    ${CART_BADGE}    ${expected_count}

Navigate To Cart
    [Documentation]    Clicks the cart icon to navigate to cart page
    Wait And Click Element    ${CART_LINK}

Verify Cart Page Is Displayed
    [Documentation]    Verifies the cart page is displayed
    Wait And Verify Text    ${PRODUCTS_TITLE}    ${CART_PAGE_TITLE}

Verify Product In Cart
    [Documentation]    Verifies a specific product is present in the cart
    [Arguments]    ${product_name}
    Wait Until Page Contains    ${product_name}    ${TIMEOUT}

Get Cart Item Count
    [Documentation]    Returns the number of items in the cart
    ${count}=    Get Element Count On Page    ${CART_ITEM}
    RETURN    ${count}

Verify Cart Item Count
    [Documentation]    Verifies the number of items in the cart matches expected
    [Arguments]    ${expected_count}
    ${actual_count}=    Get Cart Item Count
    Should Be Equal As Integers    ${actual_count}    ${expected_count}
    ...    Expected ${expected_count} items in cart but found ${actual_count}

Remove Product From Cart By Name
    [Documentation]    Removes a product from cart using its name
    [Arguments]    ${product_name}
    ${formatted_name}=    Convert Product Name To Id    ${product_name}
    Wait And Click Element    id:remove-${formatted_name}
