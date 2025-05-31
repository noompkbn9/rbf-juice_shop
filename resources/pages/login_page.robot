*** Settings ***
Resource    base_page.robot

*** Variables ***
# Login page locators
${LOGIN_EMAIL_FIELD}    id=email
${LOGIN_PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=loginButton

*** Keywords ***
Navigate To Login Page
    Open Browser To Page
    Dismiss Welcome Dialog If Present
    Dismiss Cookie Notice If Present
    Go To    ${LOGIN_URL}
 #   Dismiss Welcome Dialog If Present
    Dismiss Cookie Notice If Present

Login With Credentials
    [Arguments]    ${email}    ${password}
    Dismiss Welcome Dialog If Present   
    Input Text When Ready    ${LOGIN_EMAIL_FIELD}    ${email}
    Input Text When Ready    ${LOGIN_PASSWORD_FIELD}    ${password}
    Dismiss Welcome Dialog If Present
    Click Element When Ready    ${LOGIN_BUTTON}
