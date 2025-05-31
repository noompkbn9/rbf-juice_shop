*** Settings ***
Resource    base_page.robot

*** Variables ***
# Product page locators
${SEARCH_ICON}    id=searchQuery
${SEARCH_FIELD}    css=#searchQuery input[type="text"]
${PRODUCT_CARDS}    css=app-search-result.ng-star-inserted div.mat-grid-tile-content
${ADD_TO_BASKET_BUTTON}    css=button[aria-label='Add to Basket']
${BASKET_ITEM_COUNT}    css=.fa-layers-counter
${BASKET_BUTTON}    css=.mat-toolbar-row button[aria-label="Show the shopping cart"]

*** Keywords ***
Search For Product
    Comment    Search for product
    [Arguments]    ${search_term}
    Click Element When Ready    ${SEARCH_ICON}
    Input Text When Ready    ${SEARCH_FIELD}    ${search_term}
    Press Keys    ${SEARCH_FIELD}    RETURN

Add Product To Basket
    Comment    Add product to basket
    [Arguments]    ${product_index}=1
    ${product_selector}=    Set Variable    (${PRODUCT_CARDS})[${product_index}]
    Wait Until Element Is Visible    ${product_selector}
    ${add_button}=    Set Variable    ${product_selector} ${ADD_TO_BASKET_BUTTON}
    Wait Until Element Is Visible    ${add_button}    timeout=10s
    Click Element    ${add_button}
    Sleep    1s    # Small wait to ensure the basket counter updates

Add Product To Basket By Index
    Comment    Add product to basket by index
    [Arguments]    ${product_index}=1
    ${product_xpath}=    Set Variable    (//mat-card)[${product_index}]//button[contains(@aria-label, 'Add to Basket')]
    Wait Until Element Is Visible    xpath=${product_xpath}    timeout=10s
    Click Element    xpath=${product_xpath}
    Sleep    1s    # Small wait to ensure the basket counter updates

Verify Product Search Results
    Comment    Verify product search results
    [Arguments]    ${expected_count}    ${search_term}
    
    Wait Until Keyword Succeeds    5x    2s    Wait Until Product Cards Exist
    ${products}=    Get WebElements    ${PRODUCT_CARDS}
    ${actual_count}=    Get Length    ${products}
    
    ${expected_count}=    Convert To Integer    ${expected_count}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Contain    ${product_text}    ${search_term}    ignore_case=True
    END

Wait Until Product Cards Exist
    Comment    Wait until product cards exist
    Wait Until Page Contains Element    ${PRODUCT_CARDS}    ${TIMEOUT}

Verify Product Not In Results
    Comment    Verify product not in results
    [Arguments]    ${unexpected_term}
    ${products}=    Get WebElements    ${PRODUCT_CARDS}
    
    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Not Contain    ${product_text}    ${unexpected_term}    ignore_case=True
    END

Go To Basket
    Comment    Go to basket
    Click Element When Ready    ${BASKET_BUTTON}
    Sleep    2s    # Small wait
