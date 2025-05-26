*** Settings ***
Resource    base_page.robot

*** Variables ***
# Address page locators
${COUNTRY_FIELD}    css=#mat-input-3
${NAME_FIELD}    css=#mat-input-4
${MOBILE_FIELD}    css=#mat-input-5
${ZIP_CODE_FIELD}    css=#mat-input-6
${ADDRESS_FIELD}    css=#address
${CITY_FIELD}    css=#mat-input-8
${STATE_FIELD}    css=#mat-input-9
${SUBMIT_BUTTON}    id=submitButton

*** Keywords ***
Fill Address Form
    [Arguments]    ${country}    ${name}    ${mobile}    ${zip}    ${address}    ${city}    ${state}
    Input Text When Ready    ${COUNTRY_FIELD}    ${country}
    Input Text When Ready    ${NAME_FIELD}    ${name}
    Input Text When Ready    ${MOBILE_FIELD}    ${mobile}
    Input Text When Ready    ${ZIP_CODE_FIELD}    ${zip}
    Input Text When Ready    ${ADDRESS_FIELD}    ${address}
    Input Text When Ready    ${CITY_FIELD}    ${city}
    Input Text When Ready    ${STATE_FIELD}    ${state}
    
Submit Address Form
    Click Element When Ready    ${SUBMIT_BUTTON}
