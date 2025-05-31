*** Settings ***
Resource    ${CURDIR}/../variables/config.robot

*** Variables ***


*** Keywords ***
Open Browser To Page
    Comment    Open browser to page
    [Arguments]    ${url}=${BASE_URL}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Wait Until Element Is Visible And Enabled
    Comment    Wait until element is visible and enabled
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}

Click Element When Ready
    Comment    Click element when ready
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}
    Click Element    ${locator}

Input Text When Ready
    Comment    Input text when ready
    [Arguments]    ${locator}    ${text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Get Text When Ready
    Comment    Get text when ready
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}

Element Should Be Visible And Enabled
    Comment    Element should be visible and enabled
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}

Element Should Contain Text
    Comment    Element should contain text
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Element Should Contain    ${locator}    ${expected_text}

Element Should Not Contain Text
    Comment    Element should not contain text
    [Arguments]    ${locator}    ${unexpected_text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Element Should Not Contain    ${locator}    ${unexpected_text}

Dismiss Welcome Dialog If Present
    Comment    Dismiss welcome dialog if present
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${WELCOME_DIALOG_DISMISS_BUTTON}    5s
    Run Keyword If    ${status}    Click Element    ${WELCOME_DIALOG_DISMISS_BUTTON}

Dismiss Cookie Notice If Present
    Comment    Dismiss cookie notice if present
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${DISMISS_COOKIE_NOTICE}    5s
    Run Keyword If    ${status}    Click Element    ${DISMISS_COOKIE_NOTICE}

Click Random Radio Button
    Comment    Click random radio button
    [Arguments]    ${locator}

    ${radio_buttons}=     Get WebElements     ${locator}
    ${count}=             Get Length          ${radio_buttons}
    Run Keyword If        not ${count} > 0    Fail       ไม่พบ mat-radio-button ในหน้า

    ${random_index}=      Evaluate    random.randint(0, ${count} - 1)    modules=random
    Log To Console        Clicking... radio index: ${random_index}

    ${By}=                Evaluate    __import__('selenium.webdriver.common.by', fromlist=['By']).By

    ${eval_locals}=       Create Dictionary    radio_buttons=${radio_buttons}    random_index=${random_index}    By=${By}

    ${target_radio}=      Evaluate    
    ...                   radio_buttons[random_index].find_element(By.XPATH, ".//input[@type='radio']")    
    ...                   None
    ...                   ${eval_locals}

    Click Element         ${target_radio}