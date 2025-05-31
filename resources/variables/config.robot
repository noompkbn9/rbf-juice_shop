*** Settings ***
Library     OperatingSystem
Library     Collections
Library     String
Library     SeleniumLibrary
Library     random

*** Variables ***
# Default configuration values
${BASE_URL}             https://juice-shop.herokuapp.com
${LOGIN_URL}            ${BASE_URL}/#/login
${DEFAULT_EMAIL}        noom_pkbn@hotmail.com
${DEFAULT_PASSWORD}     Test123!
${BROWSER}              chrome
#${BROWSER}              edge
#${BROWSER}              headlesschrome
${TIMEOUT}              10

${DISMISS_COOKIE_NOTICE}    class=cc-dismiss
${WELCOME_DIALOG_DISMISS_BUTTON}    css=button[aria-label='Close Welcome Banner']

# Test data
${ADDR_COUNTRY}     Thailand
${ADDR_NAME}        Pongsak Bo
${ADDR_MOBILE}      0948951234
${ADDR_ZIP}         10000
${ADDR_ADDRESS}     123 Ratchadapisek Rd.
${ADDR_CITY}        Din Deang
${ADDR_STATE}       Bangkok

# Search terms
${SEARCH_TERM_APPLE}            apple
${EXPECTED_APPLE_RESULTS}       2
${SEARCH_TERM_BANANA}           banana
