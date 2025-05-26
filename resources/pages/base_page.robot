*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../variables/config.robot

*** Variables ***
${BROWSER}    chrome
${TIMEOUT}    10

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}=${BASE_URL}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Wait Until Element Is Visible And Enabled
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}

Click Element When Ready
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}
    Click Element    ${locator}

Input Text When Ready
    [Arguments]    ${locator}    ${text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Get Text When Ready
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}

Element Should Be Visible And Enabled
    [Arguments]    ${locator}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}

Element Should Contain Text
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Element Should Contain    ${locator}    ${expected_text}

Element Should Not Contain Text
    [Arguments]    ${locator}    ${unexpected_text}    ${timeout}=${TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Element Should Not Contain    ${locator}    ${unexpected_text}
