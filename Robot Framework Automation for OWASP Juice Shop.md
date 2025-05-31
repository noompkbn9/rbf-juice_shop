# Robot Framework Automation for OWASP Juice Shop

[![GitHub license](https://img.shields.io/github/license/noompkbn9/rbf-juice_shop)](https://github.com/noompkbn9/rbf-juice_shop/blob/main/LICENSE)
[![Robot Framework](https://img.shields.io/badge/tested%20with-Robot%20Framework-brightgreen.svg)](https://robotframework.org)
[![OWASP Juice Shop](https://img.shields.io/badge/tested%20against-OWASP%20Juice%20Shop-orange.svg)](https://owasp.org/www-project-juice-shop/)

A comprehensive test automation framework for OWASP Juice Shop using Robot Framework with Page Object Model (POM) pattern. This project demonstrates best practices in test automation for web applications.

## 📋 Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running Tests](#running-tests)
- [Test Scenarios](#test-scenarios)
- [Best Practices Implemented](#best-practices-implemented)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## ✨ Features

- **Page Object Model (POM)** architecture for maintainable test code
- **Configurable environments** via environment variables or config files
- **Robust element handling** with proper waits and synchronization
- **Modular test structure** for easy extension and maintenance
- **Cross-browser testing** support (Chrome, Firefox)
- **Detailed reporting** with screenshots on failures
- **CI/CD ready** with GitHub Actions integration

## 📁 Project Structure

```
rbf-juice_shop/
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
├── result/              # Test execution results
├── requirements.txt     # Python dependencies
├── run_tests.sh         # Shell script to run tests
├── chk_version.cmd      # Windows script to check versions
└── README.md            # Project documentation
```

## 🔧 Prerequisites

- Python 3.6 or higher
- Chrome or Firefox browser
- Git (for cloning the repository)

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/noompkbn9/rbf-juice_shop.git
cd rbf-juice_shop
```

### 2. Create and activate a virtual environment

**Linux/macOS:**
```bash
python -m venv venv
source venv/bin/activate
```

**Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Initialize the browser library (if using robotframework-browser)

```bash
rfbrowser init
```

## ⚙️ Configuration

The tests can be configured using environment variables:

| Variable | Description | Default Value |
|----------|-------------|---------------|
| `JUICE_SHOP_URL` | URL of the OWASP Juice Shop application | https://juice-shop.herokuapp.com |
| `JUICE_SHOP_EMAIL` | Email for login | noom_pkbn@hotmail.com |
| `JUICE_SHOP_PASSWORD` | Password for login | Test123! |
| `BROWSER` | Browser to use for testing | chrome |
| `TIMEOUT` | Default timeout in seconds | 10 |

## ▶️ Running Tests

### Run all tests

```bash
# Linux/macOS
./run_tests.sh

# Windows
robot -d result tests/
```

### Run a specific test

```bash
robot -d result tests/scenario1_test.robot
```

### Run tests with custom configuration

```bash
# Linux/macOS
JUICE_SHOP_URL=https://your-juice-shop-url.com BROWSER=firefox robot -d result tests/

# Windows (PowerShell)
$env:JUICE_SHOP_URL="https://your-juice-shop-url.com"; $env:BROWSER="firefox"; robot -d result tests/
```

### Run tests with tags

```bash
robot -d result -i smoke tests/
```

## 📝 Test Scenarios

1. **Scenario 1**: Login with user, add 1 item to the basket, checkout, add a new address
   - File: `tests/scenario1_test.robot`
   - Tests the basic purchase flow with a single item

2. **Scenario 2**: Login with user, add 2 items to the basket, checkout, add a new address
   - File: `tests/scenario2_test.robot`
   - Tests the purchase flow with multiple items

3. **Scenario 3**: Search functionality test
   - File: `tests/scenario3_test.robot`
   - Tests the search feature, verifying correct results appear and irrelevant products don't

## 💯 Best Practices Implemented

1. **Page Object Model (POM)**: Separates test logic from page interactions
2. **Configurable Environment**: Uses environment variables for flexible configuration
3. **Modular Structure**: Organized by functionality for maintainability
4. **Reusable Keywords**: Common actions are abstracted into reusable keywords
5. **Clear Documentation**: Each file and test case includes documentation
6. **Consistent Naming**: Follows Robot Framework naming conventions
7. **Error Handling**: Includes proper waiting and verification steps
8. **Clean Setup/Teardown**: Each test has proper setup and teardown procedures
9. **Dialog Handling**: Robust handling of welcome and cookie dialogs
10. **Element Selection**: Uses reliable locator strategies (ID, CSS, XPath)

## 🤝 Contributing

Contributions are welcome! Here's how you can contribute:

1. **Fork the repository**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit your changes**:
   ```bash
   git commit -m "Add some feature"
   ```
4. **Push to your branch**:
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Create a Pull Request**

Please ensure your code follows the project's coding standards and includes appropriate tests.

## ❓ Troubleshooting

### Common Issues

1. **Browser not starting**
   - Ensure you have the correct browser driver installed
   - Check if your browser version is compatible with the driver
   - Try running with a different browser: `BROWSER=firefox robot -d result tests/`

2. **Element not found errors**
   - The application UI might have changed; update the locators in the page object files
   - Increase the timeout: `TIMEOUT=20 robot -d result tests/`

3. **Login failures**
   - Verify the credentials in config.robot or set correct environment variables
   - Check if the application is accessible at the configured URL

### Getting Help

If you encounter issues not covered here, please [open an issue](https://github.com/noompkbn9/rbf-juice_shop/issues) on GitHub.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Developed with ❤️ by [noompkbn9](https://github.com/noompkbn9)
