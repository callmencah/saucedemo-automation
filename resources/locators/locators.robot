*** Settings ***
Documentation    Common variables for locators used across test suites
...              SauceDemo - https://www.saucedemo.com/

*** Variables ***
# ==================== URL ====================
${BASE_URL}                     https://www.saucedemo.com

# ==================== LOGIN PAGE ====================
${INPUT_USERNAME}               id:user-name
${INPUT_PASSWORD}               id:password
${BTN_LOGIN}                    id:login-button
${ERROR_MESSAGE}                css:h3[data-test="error"]

# ==================== PRODUCTS PAGE ====================
${PRODUCTS_TITLE}               css:.title
${PRODUCT_LIST}                 css:.inventory_item
${PRODUCT_NAME}                 css:.inventory_item_name
${PRODUCT_PRICE}                css:.inventory_item_price
${BTN_ADD_TO_CART}              css:button[id^="add-to-cart"]

# ==================== CART ====================
${CART_BADGE}                   css:.shopping_cart_badge
${CART_LINK}                    css:.shopping_cart_link
${CART_ITEM}                    css:.cart_item
${CART_ITEM_NAME}               css:.inventory_item_name
${BTN_REMOVE}                   css:button[id^="remove"]
${BTN_CONTINUE_SHOPPING}        id:continue-shopping
${BTN_CHECKOUT}                 id:checkout

# ==================== CHECKOUT ====================
${INPUT_FIRST_NAME}             id:first-name
${INPUT_LAST_NAME}              id:last-name
${INPUT_POSTAL_CODE}            id:postal-code
${BTN_CONTINUE}                 id:continue
${BTN_CANCEL}                   id:cancel
${BTN_FINISH}                   id:finish
${CHECKOUT_ERROR}               css:h3[data-test="error"]
${CHECKOUT_COMPLETE_TITLE}      css:.complete-header
${CHECKOUT_COMPLETE_TEXT}        css:.complete-text
${BTN_BACK_HOME}                id:back-to-products

# ==================== MENU / LOGOUT ====================
${BTN_MENU}                     id:react-burger-menu-btn
${BTN_LOGOUT}                   id:logout_sidebar_link
${MENU_CLOSE}                   id:react-burger-cross-btn
