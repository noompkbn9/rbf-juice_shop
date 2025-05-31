# Robot Framework OWASP Juice Shop - User Guide

## Introduction

This user guide provides detailed instructions for using the Robot Framework automation suite for testing the OWASP Juice Shop application. It covers installation, configuration, test execution, and customization to help you get started quickly and make the most of this test automation framework.

## Table of Contents

1. [Getting Started](#getting-started)
   - [Installation](#installation)
   - [First-time Setup](#first-time-setup)
2. [Running Tests](#running-tests)
   - [Basic Test Execution](#basic-test-execution)
   - [Running Specific Tests](#running-specific-tests)
   - [Customizing Test Execution](#customizing-test-execution)
3. [Understanding the Framework](#understanding-the-framework)
   - [Page Object Model](#page-object-model)
   - [Test Structure](#test-structure)
   - [Configuration System](#configuration-system)
4. [Extending the Framework](#extending-the-framework)
   - [Adding New Page Objects](#adding-new-page-objects)
   - [Creating New Test Cases](#creating-new-test-cases)
   - [Adding Custom Keywords](#adding-custom-keywords)
5. [Troubleshooting](#troubleshooting)
   - [Common Issues](#common-issues)
   - [Debugging Tips](#debugging-tips)
6. [Best Practices](#best-practices)
   - [Writing Maintainable Tests](#writing-maintainable-tests)
   - [Effective Locator Strategies](#effective-locator-strategies)
   - [Test Data Management](#test-data-management)

## Getting Started

### Installation

#### Prerequisites

Before installing the framework, ensure you have:

- Python 3.6 or higher installed
- Git installed
- Chrome or Firefox browser installed

#### Step-by-Step Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/noompkbn9/rbf-juice_shop.git
   cd rbf-juice_shop
   ```

2. **Create a virtual environment**

   For Linux/macOS:
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```

   For Windows:
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

3. **Install dependencies**

   ```bash
   pip install -r requirements.txt
   ```

### First-time Setup

1. **Verify installation**

   Run the version check script to ensure all components are correctly installed:

   For Windows:
   ```bash
   chk_version.cmd
   ```

   For Linux/macOS:
   ```bash
   python -c "import robot; print(f'Robot Framework version: {robot.__version__}')"
   python -c "import SeleniumLibrary; print(f'SeleniumLibrary version: {SeleniumLibrary.__version__}')"
   ```

2. **Configure environment variables (optional)**

   You can customize the test environment by setting environment variables:

   For Linux/macOS:
   ```bash
   export JUICE_SHOP_URL=https://juice-shop.herokuapp.com
   export JUICE_SHOP_EMAIL=noom_pkbn@hotmail.com
   export JUICE_SHOP_PASSWORD=Test123!
   export BROWSER=chrome
   ```

   For Windows:
   ```bash
   set JUICE_SHOP_URL=https://juice-shop.herokuapp.com
   set JUICE_SHOP_EMAIL=noom_pkbn@hotmail.com
   set JUICE_SHOP_PASSWORD=Test123!
   set BROWSER=chrome
   ```

## Running Tests

### Basic Test Execution

To run all tests and generate reports in the `result` directory:

```bash
robot -d result tests/
```

This will execute all test cases in the `tests` directory and save the reports in the `result` directory.

### Running Specific Tests

To run a specific test file:

```bash
robot -d result tests/scenario1_test.robot
```

To run tests with specific tags:

```bash
robot -d result -i login tests/
```

To run a specific test case by name:

```bash
robot -d result -t "User Should Be Able To Login Add One Item And Complete Checkout" tests/
```

### Customizing Test Execution

#### Using different browsers

```bash
# Using Chrome (default)
robot -d result -v BROWSER:chrome tests/

# Using Firefox
robot -d result -v BROWSER:firefox tests/

# Using headless Chrome
robot -d result -v BROWSER:"headlesschrome" tests/
```

#### Setting timeouts

```bash
robot -d result -v TIMEOUT:20 tests/
```

#### Using different credentials

```bash
robot -d result -v DEFAULT_EMAIL:your_email@example.com -v DEFAULT_PASSWORD:your_password tests/
```

#### Testing against a different Juice Shop instance

```bash
robot -d result -v BASE_URL:https://your-juice-shop-instance.com tests/
```

## Understanding the Framework

### Page Object Model

The framework uses the Page Object Model (POM) pattern to separate test logic from page interactions:

- **Base Page** (`resources/pages/base_page.robot`): Contains common functions used across all pages
- **Page Objects** (`resources/pages/*.robot`): Represent specific pages in the application
- **Test Cases** (`tests/*.robot`): Use page objects to implement test scenarios

Example of a page object:

```robotframework
*** Settings ***
Resource    base_page.robot

*** Variables ***
${LOGIN_EMAIL_FIELD}    id=email
${LOGIN_PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=loginButton

*** Keywords ***
Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Text When Ready    ${LOGIN_EMAIL_FIELD}    ${email}
    Input Text When Ready    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Element When Ready    ${LOGIN_BUTTON}
```

### Test Structure

Each test file follows a similar structure:

1. **Settings**: Imports required resources and sets up test configuration
2. **Test Cases**: Defines the actual test scenarios
3. **Keywords**: Contains test-specific keywords (if needed)

Example:

```robotframework
*** Settings ***
Documentation     Test scenario 1: Login, add 1 item to basket, checkout, add address
Resource          ../resources/pages/login_page.robot
Resource          ../resources/pages/product_page.robot
Test Setup        Setup Test
Test Teardown     Close All Browsers

*** Test Cases ***
User Should Be Able To Login Add One Item And Complete Checkout
    [Documentation]    Tests the flow of logging in, adding 1 item to basket, and completing checkout
    
    # Login
    Login With Credentials    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    
    # Add 1 item to basket
    Add Product To Basket    1
    
    # Verify success
    Element Should Be Visible And Enabled    ${CONTINUE_BUTTON}

*** Keywords ***
Setup Test
    Load Environment Variables
    Navigate To Login Page
```

### Configuration System

The framework uses a hierarchical configuration system:

1. **Default values** in `resources/variables/config.robot`
2. **Environment variables** loaded by `resources/variables/env_loader.robot`
3. **Command-line variables** passed during test execution

This allows for flexible configuration without modifying the code.

## Extending the Framework

### Adding New Page Objects

To add a new page object:

1. Create a new file in `resources/pages/` (e.g., `payment_page.robot`)
2. Import the base page: `Resource    base_page.robot`
3. Define locators in the Variables section
4. Implement page-specific keywords in the Keywords section

Example:

```robotframework
*** Settings ***
Resource    base_page.robot

*** Variables ***
${PAYMENT_CARD_NUMBER}    id=card-number
${PAYMENT_SUBMIT_BUTTON}    id=submit-payment

*** Keywords ***
Enter Payment Details
    [Arguments]    ${card_number}    ${expiry}    ${cvv}
    Input Text When Ready    ${PAYMENT_CARD_NUMBER}    ${card_number}
    # Add more input fields as needed
    Click Element When Ready    ${PAYMENT_SUBMIT_BUTTON}
```

### Creating New Test Cases

To create a new test case:

1. Create a new file in `tests/` (e.g., `payment_test.robot`)
2. Import required page objects in the Settings section
3. Define test cases using the imported keywords
4. Add test-specific keywords if needed

Example:

```robotframework
*** Settings ***
Documentation     Test payment functionality
Resource          ../resources/pages/login_page.robot
Resource          ../resources/pages/product_page.robot
Resource          ../resources/pages/payment_page.robot
Test Setup        Setup Test
Test Teardown     Close All Browsers

*** Test Cases ***
User Should Be Able To Complete Payment
    [Documentation]    Tests the payment flow
    
    # Login and add product
    Login With Credentials    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    Add Product To Basket    1
    
    # Complete payment
    Enter Payment Details    4111111111111111    12/25    123
    
    # Verify success
    Element Should Be Visible    ${PAYMENT_SUCCESS_MESSAGE}
```

### Adding Custom Keywords

For reusable functionality across tests:

1. Create a new file in `resources/keywords/` (e.g., `validation_keywords.robot`)
2. Implement your custom keywords
3. Import this file in your test cases

Example:

```robotframework
*** Settings ***
Resource    ../pages/base_page.robot

*** Keywords ***
Verify Product Details
    [Arguments]    ${product_name}    ${product_price}
    Element Should Contain    ${PRODUCT_NAME_ELEMENT}    ${product_name}
    Element Should Contain    ${PRODUCT_PRICE_ELEMENT}    ${product_price}
```

## Troubleshooting

### Common Issues

#### Browser Driver Issues

**Problem**: Tests fail with "WebDriverException" or "SessionNotCreatedException"

**Solution**:
1. Update your browser to the latest version
2. Ensure you have the correct webdriver installed
3. Try using a different browser: `robot -v BROWSER:firefox -d result tests/`

#### Element Not Found Issues

**Problem**: Tests fail with "ElementNotFound" or "ElementNotVisible"

**Solution**:
1. Check if the application UI has changed and update locators
2. Increase the timeout: `robot -v TIMEOUT:20 -d result tests/`
3. Add explicit waits before interacting with elements

#### Login Failures

**Problem**: Tests fail during login step

**Solution**:
1. Verify the credentials in `config.robot` or environment variables
2. Check if the application is accessible at the configured URL
3. Inspect the login page for changes in element IDs or structure

### Debugging Tips

#### Enable Selenium debug logs

```bash
robot --loglevel DEBUG:INFO -d result tests/
```

#### Slow down test execution for visual debugging

```bash
robot -v SELENIUM_SPEED:0.5s -d result tests/
```

#### Take screenshots on failure

```bash
robot -d result --listener Screenshot::True tests/
```

## Best Practices

### Writing Maintainable Tests

1. **Follow the Page Object Model** strictly
   - Keep all locators in page object files
   - Implement page-specific actions as keywords

2. **Use descriptive names**
   - Test cases should clearly describe what they're testing
   - Keywords should describe the action they perform

3. **Keep tests independent**
   - Each test should be able to run on its own
   - Use proper setup and teardown procedures

### Effective Locator Strategies

In order of preference:

1. **ID selectors**: Most reliable and performant
   ```
   id=loginButton
   ```

2. **CSS selectors**: Good balance of readability and flexibility
   ```
   css=button[aria-label='Add to Basket']
   ```

3. **XPath**: Use when necessary, but avoid complex paths
   ```
   xpath=//mat-card[1]//button[contains(@aria-label, 'Add to Basket')]
   ```

### Test Data Management

1. **Use variables for test data**
   - Store common test data in `resources/variables/config.robot`
   - Use test-specific data in test files

2. **Consider data-driven testing for repetitive tests**
   - Use CSV or Excel files for test data
   - Use the `DataDriver` library for data-driven tests

3. **Handle test data cleanup**
   - Ensure tests clean up after themselves
   - Use teardown procedures to restore the application state

---

## Additional Resources

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [OWASP Juice Shop Project](https://owasp.org/www-project-juice-shop/)

---

For questions or support, please open an issue on the [GitHub repository](https://github.com/noompkbn9/rbf-juice_shop/issues).
