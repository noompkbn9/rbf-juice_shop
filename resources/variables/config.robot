*** Variables ***
# Default configuration values
${BASE_URL}    https://juice-shop.herokuapp.com
${LOGIN_URL}    ${BASE_URL}/#/login
${DEFAULT_EMAIL}    noom_pkbn@hotmail.com
${DEFAULT_PASSWORD}    Test123!
#${BROWSER}    chrome
${BROWSER}    edge
#${BROWSER}    headlesschrome
${TIMEOUT}    10

# Test data
${TEST_COUNTRY}    United States
${TEST_NAME}    John Doe
${TEST_MOBILE}    1234567890
${TEST_ZIP}    12345
${TEST_ADDRESS}    123 Test Street
${TEST_CITY}    Test City
${TEST_STATE}    Test State

# Search terms
${SEARCH_TERM_APPLE}    apple
${EXPECTED_APPLE_RESULTS}    2
${SEARCH_TERM_BANANA}    banana
