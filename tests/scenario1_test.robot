*** Settings ***
Documentation     Test scenario 1: Login, add 1 item to basket, checkout, add address, select delivery speed
Resource          ${CURDIR}/../resources/pages/login_page.robot
Resource          ${CURDIR}/../resources/pages/product_page.robot
Resource          ${CURDIR}/../resources/pages/basket_page.robot
Resource          ${CURDIR}/../resources/pages/checkout_page.robot
Resource          ${CURDIR}/../resources/pages/address_page.robot
Resource          ${CURDIR}/../resources/pages/delivery_page.robot
Resource          ${CURDIR}/../resources/variables/env_loader.robot
#Resource          ${CURDIR}/../resources/variables/config.robot
Test Setup        Setup Test
Test Teardown     Close All Browsers

*** Test Cases ***
User Should Be Able To Login Add One Item And Complete Checkout
    [Documentation]    Tests the flow of logging in, adding 1 item to basket, and completing checkout with a new address
    
    # Login
    Login With Credentials    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}

    # Add 1 item to basket
    ${item_before_add}=    Check Current Items In Basket
    Add Product To Basket By Index    1
    
    # Go to basket
    Go To Basket
    Verify Items In Basket    1    ${item_before_add}
    
    # Proceed to checkout
    Proceed To Checkout
    
    # Add new address
    Add New Address
    Fill Address Form    ${ADDR_COUNTRY}    ${ADDR_NAME}    ${ADDR_MOBILE}    ${ADDR_ZIP}    ${ADDR_ADDRESS}    ${ADDR_CITY}    ${ADDR_STATE}
    Submit Address Form
    
    # Select Address
    Select Existing Address
    Continue To Delivery Options

    # Select Delivery speed
    Select Delivery Speed
    Continue To Verify

*** Keywords ***
Setup Test
    Comment    Setup Test
    Load Environment Variables
    Navigate To Login Page
