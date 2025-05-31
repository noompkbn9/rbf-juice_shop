*** Settings ***
Resource    base_page.robot

*** Variables ***
# Basket page locators
${BASKET_ITEMS}        css=.fa-layers-counter
${CHECKOUT_BUTTON}     id=checkoutButton
${ITEM_QUANTITY}       css=mat-cell.mat-column-quantity

*** Keywords ***
Check Current Items In Basket
    Wait Until Element Is Visible And Enabled    ${BASKET_ITEMS}
    Sleep    2s    # Small wait
    ${current_count}=    Get Text    ${BASKET_ITEMS}
    RETURN    ${current_count}

Verify Items In Basket
    [Arguments]    ${item_count}    ${item_before_add_count}

    ${expected_count}=     Evaluate    ${item_count} + ${item_before_add_count}
    Sleep    2s    # Small wait
    ${actual_count}=    Get Text    ${BASKET_ITEMS}
    Should Be Equal As Integers   ${actual_count}    ${expected_count}

Proceed To Checkout
    Click Element When Ready    ${CHECKOUT_BUTTON}
    Sleep    2s    # Small wait    
