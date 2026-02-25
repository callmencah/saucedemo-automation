*** Settings ***
Documentation    Keywords specific to Product List page
Resource         common_keywords.robot

*** Keywords ***
Verify Products Page Is Displayed
    [Documentation]    Verifies the Products page title is visible
    Wait And Verify Text    ${PRODUCTS_TITLE}    ${PRODUCTS_PAGE_TITLE}

Verify Product List Is Not Empty
    [Documentation]    Verifies that at least one product is displayed
    ${count}=    Get Element Count On Page    ${PRODUCT_LIST}
    Should Be True    ${count} > 0    No products found on the page

Get Total Product Count
    [Documentation]    Returns the total number of products displayed
    ${count}=    Get Element Count On Page    ${PRODUCT_LIST}
    RETURN    ${count}

Verify Products Have Required Info
    [Documentation]    Verifies each product has name, price, and Add to Cart button
    ${products}=    Get WebElements    ${PRODUCT_LIST}
    FOR    ${product}    IN    @{products}
        ${name}=    Get Text    ${product.find_element("css selector", ".inventory_item_name")}
        Should Not Be Empty    ${name}    Product name should not be empty
        ${price}=    Get Text    ${product.find_element("css selector", ".inventory_item_price")}
        Should Match Regexp    ${price}    ^\\$\\d+\\.\\d{2}$    Price format should be $XX.XX
        ${btn}=    Get Text    ${product.find_element("css selector", "button")}
        Should Not Be Empty    ${btn}    Add to Cart button should exist
    END

Verify Product Name Exists
    [Documentation]    Verifies a specific product name exists on the page
    [Arguments]    ${product_name}
    Page Should Contain    ${product_name}
