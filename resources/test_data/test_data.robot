*** Settings ***
Documentation    Test data for SauceDemo automation tests

*** Variables ***
# ==================== VALID CREDENTIALS ====================
${VALID_USERNAME}           standard_user
${VALID_PASSWORD}           secret_sauce

# ==================== INVALID CREDENTIALS ====================
${INVALID_USERNAME}         invalid_user
${INVALID_PASSWORD}         wrong_password
${LOCKED_USERNAME}          locked_out_user

# ==================== ERROR MESSAGES ====================
${ERROR_INVALID_LOGIN}      Epic sadface: Username and password do not match any user in this service
${ERROR_LOCKED_USER}        Epic sadface: Sorry, this user has been locked out.
${ERROR_EMPTY_USERNAME}     Epic sadface: Username is required
${ERROR_EMPTY_PASSWORD}     Epic sadface: Password is required
${ERROR_FIRST_NAME_REQ}     Error: First Name is required
${ERROR_LAST_NAME_REQ}      Error: Last Name is required
${ERROR_POSTAL_CODE_REQ}    Error: Postal Code is required

# ==================== PAGE TITLES ====================
${PRODUCTS_PAGE_TITLE}      Products
${CART_PAGE_TITLE}           Your Cart
${CHECKOUT_STEP_ONE_TITLE}  Checkout: Your Information
${CHECKOUT_STEP_TWO_TITLE}  Checkout: Overview
${CHECKOUT_COMPLETE_HEADER}  Thank you for your order!

# ==================== PRODUCT DATA ====================
${PRODUCT_1_NAME}           Sauce Labs Backpack
${PRODUCT_2_NAME}           Sauce Labs Bike Light
${PRODUCT_3_NAME}           Sauce Labs Bolt T-Shirt

# ==================== CHECKOUT DATA ====================
${FIRST_NAME}               John
${LAST_NAME}                Doe
${POSTAL_CODE}              12345

# ==================== TIMEOUT ====================
${TIMEOUT}                  10s
