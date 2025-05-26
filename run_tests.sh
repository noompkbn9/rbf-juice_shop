#!/bin/bash

# Run linting on Robot Framework files
echo "Running Robot Framework linting..."
python -m rflint tests/ resources/

# Run the tests with a custom report name
echo "Running tests..."
robot --outputdir results --name "OWASP Juice Shop Tests" tests/

# Display test results summary
echo "Test execution completed. Results are in the 'results' directory."
