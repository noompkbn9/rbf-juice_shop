*** Settings ***
Documentation     Test scenario 2: Login, add 2 items to basket, checkout, add address
Resource          ${CURDIR}/../resources/pages/login_page.robot
Resource          ${CURDIR}/../resources/pages/product_page.robot
Resource          ${CURDIR}/../resources/pages/basket_page.robot
Resource          ${CURDIR}/../resources/pages/checkout_page.robot
Resource          ${CURDIR}/../resources/pages/address_page.robot
Resource          ${CURDIR}/../resources/variables/env_loader.robot
#Resource          ${CURDIR}/../resources/variables/config.robot
Test Setup        Setup Test
Test Teardown     Close All Browsers

*** Test Cases ***
User Should Be Able To Login Add Two Items And Complete Checkout
    [Documentation]    Tests the flow of logging in, adding 2 items to basket, and completing checkout with a new address
    
    # Login
    Login With Credentials    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    
    # Add 2 items to basket
    Add Product To Basket    1
    Add Product To Basket    2
    
    # Go to basket
    Go To Basket
    Verify Items In Basket    2
    
    # Proceed to checkout
    Proceed To Checkout
    
    # Add new address
    Add New Address
    Fill Address Form    ${TEST_COUNTRY}    ${TEST_NAME}    ${TEST_MOBILE}    ${TEST_ZIP}    ${TEST_ADDRESS}    ${TEST_CITY}    ${TEST_STATE}
    Submit Address Form
    
    # Verify success
    Element Should Be Visible And Enabled    ${CONTINUE_BUTTON}

*** Keywords ***
Setup Test
    Load Environment Variables
    Navigate To Login Page
