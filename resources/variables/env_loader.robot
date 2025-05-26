*** Settings ***
Library    OperatingSystem

*** Keywords ***
Get Environment Variable Or Default
    [Arguments]    ${env_var}    ${default_value}
    ${value}=    Run Keyword And Return Status    Environment Variable Should Be Set    ${env_var}
    ${result}=    Run Keyword If    ${value}    Get Environment Variable    ${env_var}
    ...    ELSE    Set Variable    ${default_value}
    RETURN    ${result}

Load Environment Variables
    # Base URL
    ${BASE_URL}=    Get Environment Variable Or Default    JUICE_SHOP_URL    ${BASE_URL}
    Set Global Variable    ${BASE_URL}
    
    # Credentials
    ${DEFAULT_EMAIL}=    Get Environment Variable Or Default    JUICE_SHOP_EMAIL    ${DEFAULT_EMAIL}
    Set Global Variable    ${DEFAULT_EMAIL}
    
    ${DEFAULT_PASSWORD}=    Get Environment Variable Or Default    JUICE_SHOP_PASSWORD    ${DEFAULT_PASSWORD}
    Set Global Variable    ${DEFAULT_PASSWORD}
    
    # Browser
    ${BROWSER}=    Get Environment Variable Or Default    BROWSER    ${BROWSER}
    Set Global Variable    ${BROWSER}
    
    # Timeout
    ${TIMEOUT}=    Get Environment Variable Or Default    TIMEOUT    ${TIMEOUT}
    Set Global Variable    ${TIMEOUT}
    
    Log To Console    Using URL: ${BASE_URL}
    Log To Console    Using Browser: ${BROWSER}
