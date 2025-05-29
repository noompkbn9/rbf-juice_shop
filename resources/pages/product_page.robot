*** Settings ***
Resource    base_page.robot

*** Variables ***
# Product page locators
${SEARCH_ICON}    css=.mat-search_icon-search
${SEARCH_FIELD}    css=#mat-input-0
${PRODUCT_CARDS}    css=.mat-mdc-card
#${ADD_TO_BASKET_BUTTON}    css=.mat-button-wrapper:contains("Add to Basket")
${ADD_TO_BASKET_BUTTON}    .basket-btn-container button
${BASKET_ITEM_COUNT}    css=.fa-layers-counter
${BASKET_BUTTON}    css=.mat-toolbar-row button[aria-label="Show the shopping cart"]

*** Keywords ***
Search For Product
    [Arguments]    ${search_term}
    Click Element When Ready    ${SEARCH_ICON}
    Input Text When Ready    ${SEARCH_FIELD}    ${search_term}
    Press Keys    ${SEARCH_FIELD}    RETURN

Add Product To Basket
    [Arguments]    ${product_index}=1
    ${product_selector}=    Set Variable    (${PRODUCT_CARDS})[${product_index}]
    ${add_button}=    Set Variable    ${product_selector} ${ADD_TO_BASKET_BUTTON}
    Click Element When Ready    ${add_button}

Verify Product Search Results
    [Arguments]    ${expected_count}    ${search_term}
    ${products}=    Get WebElements    ${PRODUCT_CARDS}
    ${actual_count}=    Get Length    ${products}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}
    
    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Contain    ${product_text}    ${search_term}    ignore_case=True
    END

Verify Product Not In Results
    [Arguments]    ${unexpected_term}
    ${products}=    Get WebElements    ${PRODUCT_CARDS}
    
    FOR    ${product}    IN    @{products}
        ${product_text}=    Get Text    ${product}
        Should Not Contain    ${product_text}    ${unexpected_term}    ignore_case=True
    END

Go To Basket
    Click Element When Ready    ${BASKET_BUTTON}
