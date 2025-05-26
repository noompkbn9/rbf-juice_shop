*** Settings ***
Resource    base_page.robot

*** Variables ***
# Login page locators
${LOGIN_EMAIL_FIELD}    id=email
${LOGIN_PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=loginButton
${DISMISS_COOKIE_NOTICE}    css=.close-dialog

*** Keywords ***
Navigate To Login Page
    Open Browser To Page
    Dismiss Cookie Notice If Present

Dismiss Cookie Notice If Present
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${DISMISS_COOKIE_NOTICE}    5s
    Run Keyword If    ${status}    Click Element    ${DISMISS_COOKIE_NOTICE}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Text When Ready    ${LOGIN_EMAIL_FIELD}    ${email}
    Input Text When Ready    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Element When Ready    ${LOGIN_BUTTON}
