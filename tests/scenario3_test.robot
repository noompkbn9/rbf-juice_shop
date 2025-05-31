*** Settings ***
Documentation     Test scenario 3: Search for apple, verify results
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
User Should Be Able To Search For Products And Verify Results
    [Documentation]    Tests the search functionality and verifies that apple products show up and banana products do not
    
    # Navigate to the site (no login needed for search)
    
    # Search for apple
    Search For Product    ${SEARCH_TERM_APPLE}
    
    # Verify that 2 apple products show up
    Verify Product Search Results    ${EXPECTED_APPLE_RESULTS}    ${SEARCH_TERM_APPLE}
    
    # Verify that banana product does not show up
    Verify Product Not In Results    ${SEARCH_TERM_BANANA}

*** Keywords ***
Setup Test
    Comment    Setup Test
    Load Environment Variables
    Open Browser To Page
    Dismiss Welcome Dialog If Present
    Dismiss Cookie Notice If Present
