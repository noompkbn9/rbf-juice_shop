*** Settings ***
Resource    base_page.robot

*** Variables ***
# Delivery page locators
${SELECT_DELIVERY_SPEED}         css=mat-row.mat-mdc-row mat-radio-button
${CONTINUE_TO_VERIFY_BUTTON}     css=button[aria-label="Proceed to delivery method selection"]

*** Keywords ***
Select Delivery Speed
    Wait Until Element Is Visible And Enabled       ${SELECT_DELIVERY_SPEED}
    Click Random Radio Button                       ${SELECT_DELIVERY_SPEED}

Continue To Verify
    Click Element When Ready                        ${CONTINUE_TO_VERIFY_BUTTON}
