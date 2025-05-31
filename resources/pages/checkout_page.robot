*** Settings ***
Resource    base_page.robot

*** Variables ***
# Checkout page locators
${ADD_NEW_ADDRESS_BUTTON}           css=button[aria-label="Add a new address"]
${SELECT_ADDRESS_BUTTON}            css=mat-row.mat-mdc-row mat-radio-button
${CONTINUE_TO_DELIVERY_BUTTON}      css=button[aria-label="Proceed to payment selection"]

*** Keywords ***
Add New Address
    Click Element When Ready    ${ADD_NEW_ADDRESS_BUTTON}

Select Existing Address
    Wait Until Element Is Visible And Enabled       ${SELECT_ADDRESS_BUTTON}
    Click Random Radio Button                       ${SELECT_ADDRESS_BUTTON}

Continue To Delivery Options
    Click Element When Ready                        ${CONTINUE_TO_DELIVERY_BUTTON}
