*** Settings ***
Resource    base_page.robot

*** Variables ***
# Address page locators
${COUNTRY_FIELD}     css=input[placeholder="Please provide a country."]
${NAME_FIELD}        css=input[placeholder="Please provide a name."]
${MOBILE_FIELD}      css=input[placeholder="Please provide a mobile number."]
${ZIP_CODE_FIELD}    css=input[placeholder="Please provide a ZIP code."]
${ADDRESS_FIELD}     id=address
${CITY_FIELD}        css=input[placeholder="Please provide a city."]
${STATE_FIELD}       css=input[placeholder="Please provide a state."]
${SUBMIT_BUTTON}     id=submitButton

*** Keywords ***
Fill Address Form
    [Arguments]    ${country}    ${name}    ${mobile}    ${zip}    ${address}    ${city}    ${state}
    Input Text When Ready    ${COUNTRY_FIELD}       ${country}
    Input Text When Ready    ${NAME_FIELD}          ${name}
    Input Text When Ready    ${MOBILE_FIELD}        ${mobile}
    Input Text When Ready    ${ZIP_CODE_FIELD}      ${zip}
    Input Text When Ready    ${ADDRESS_FIELD}       ${address}
    Input Text When Ready    ${CITY_FIELD}          ${city}
    Input Text When Ready    ${STATE_FIELD}         ${state}
    
Submit Address Form
    Sleep    1s
    Click Element When Ready    ${SUBMIT_BUTTON}
    Sleep    2s
