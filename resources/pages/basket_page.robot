*** Settings ***
Resource    base_page.robot

*** Variables ***
# Basket page locators
${BASKET_ITEMS}    css=.fa-layers-counter
#${BASKET_ITEMS}    css=mat-row.mat-row
${CHECKOUT_BUTTON}    id=checkoutButton
${ITEM_QUANTITY}    css=mat-cell.mat-column-quantity

*** Keywords ***
Verify Items In Basket
    [Arguments]    ${expected_count}
    #${items}=    Get WebElements    ${BASKET_ITEMS}
    ${actual_count}=    Get Text    ${BASKET_ITEMS}
    Should Be Equal As Integers   ${actual_count}    ${expected_count}

Proceed To Checkout
    Click Element When Ready    ${CHECKOUT_BUTTON}
    Sleep    2s    # Small wait    
