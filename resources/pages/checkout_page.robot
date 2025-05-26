*** Settings ***
Resource    base_page.robot

*** Variables ***
# Checkout page locators
${ADD_NEW_ADDRESS_BUTTON}    css=mat-panel-title:contains("Add a new address")
${SELECT_ADDRESS_BUTTON}    css=mat-radio-button
${CONTINUE_BUTTON}    css=button:contains("Continue")

*** Keywords ***
Add New Address
    Click Element When Ready    ${ADD_NEW_ADDRESS_BUTTON}

Select Existing Address
    [Arguments]    ${address_index}=1
    ${address_selector}=    Set Variable    (${SELECT_ADDRESS_BUTTON})[${address_index}]
    Click Element When Ready    ${address_selector}

Continue To Next Step
    Click Element When Ready    ${CONTINUE_BUTTON}
