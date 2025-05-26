# OWASP Juice Shop Automation with Robot Framework

This project contains automated tests for the OWASP Juice Shop application using Robot Framework with Page Object Model (POM) pattern.

## Project Structure

```
juice-shop-tests/
├── resources/
│   ├── pages/           # Page Object Model files
│   │   ├── base_page.robot
│   │   ├── login_page.robot
│   │   ├── product_page.robot
│   │   ├── basket_page.robot
│   │   ├── checkout_page.robot
│   │   └── address_page.robot
│   ├── keywords/        # Custom keywords and utilities
│   └── variables/       # Configuration and test data
│       ├── config.robot
│       └── env_loader.robot
├── tests/               # Test cases
│   ├── scenario1_test.robot
│   ├── scenario2_test.robot
│   └── scenario3_test.robot
├── venv/                # Virtual environment (not included in version control)
└── README.md            # Project documentation
```

## Prerequisites

- Python 3.6 or higher
- Chrome or Firefox browser

## Installation

1. Clone the repository
2. Create and activate a virtual environment:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```
3. Install dependencies:
   ```
   pip install robotframework robotframework-seleniumlibrary robotframework-browser webdrivermanager
   ```
4. Initialize the browser library:
   ```
   rfbrowser init
   ```

## Configuration

The tests can be configured using environment variables:

- `JUICE_SHOP_URL`: URL of the OWASP Juice Shop application (default: https://juice-shop.herokuapp.com)
- `JUICE_SHOP_EMAIL`: Email for login (default: test@example.com)
- `JUICE_SHOP_PASSWORD`: Password for login (default: Test123!)
- `BROWSER`: Browser to use for testing (default: chrome)
- `TIMEOUT`: Default timeout in seconds (default: 10)

## Running Tests

To run all tests:
```
robot -d results tests/
```

To run a specific test:
```
robot -d results tests/scenario1_test.robot
```

To run tests with custom configuration:
```
JUICE_SHOP_URL=https://your-juice-shop-url.com BROWSER=firefox robot -d results tests/
```

## Test Scenarios

1. **Scenario 1**: Login with user, add 1 item to the basket, click on checkout, add a new address, fill in the address form, click on submit
2. **Scenario 2**: Same flow as Scenario 1, but add 2 items to the basket
3. **Scenario 3**: Click on the search button, search for apple, verify that 2 apple products show up and that banana product does not show up

## Best Practices Implemented

1. **Page Object Model (POM)**: Separates test logic from page interactions
2. **Configurable Environment**: Uses environment variables for flexible configuration
3. **Modular Structure**: Organized by functionality for maintainability
4. **Reusable Keywords**: Common actions are abstracted into reusable keywords
5. **Clear Documentation**: Each file and test case includes documentation
6. **Consistent Naming**: Follows Robot Framework naming conventions
7. **Error Handling**: Includes proper waiting and verification steps
8. **Clean Setup/Teardown**: Each test has proper setup and teardown procedures

## Notes

- The locators in the page objects may need adjustment based on the actual application structure
- For a real implementation, you would need valid credentials and a running instance of the OWASP Juice Shop
