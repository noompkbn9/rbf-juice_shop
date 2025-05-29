*** Settings ***
Resource    base_page.robot

*** Variables ***
# Login page locators
${LOGIN_EMAIL_FIELD}    id=email
${LOGIN_PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=loginButton
#${LOGIN_BUTTON}    css=button[aria-label='Login']
#${DISMISS_COOKIE_NOTICE}    css=.close-dialog
${DISMISS_COOKIE_NOTICE}    class=cc-dismiss
${WELCOME_DIALOG_DISMISS_BUTTON}    css=button[aria-label='Close Welcome Banner']
#${WELCOME_DIALOG_DISMISS_BUTTON}    class=button-footer[button[1]]

*** Keywords ***
Navigate To Login Page
    Open Browser To Page
    Dismiss Welcome Dialog If Present
    Dismiss Cookie Notice If Present
    Go To    ${LOGIN_URL}
 #   Dismiss Welcome Dialog If Present
 #   Dismiss Cookie Notice If Present

Dismiss Welcome Dialog If Present
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${WELCOME_DIALOG_DISMISS_BUTTON}    5s
    Run Keyword If    ${status}    Click Element    ${WELCOME_DIALOG_DISMISS_BUTTON}

Dismiss Cookie Notice If Present
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${DISMISS_COOKIE_NOTICE}    5s
    Run Keyword If    ${status}    Click Element    ${DISMISS_COOKIE_NOTICE}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Dismiss Welcome Dialog If Present   
    Input Text When Ready    ${LOGIN_EMAIL_FIELD}    ${email}
    Input Text When Ready    ${LOGIN_PASSWORD_FIELD}    ${password}
    Dismiss Welcome Dialog If Present
    Click Element When Ready    ${LOGIN_BUTTON}
