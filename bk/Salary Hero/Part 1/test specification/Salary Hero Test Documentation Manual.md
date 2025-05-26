# Salary Hero Test Documentation Manual

## Introduction

This manual provides a comprehensive guide to the test documentation structure for the Salary Hero application. It explains the purpose and content of each sheet in both the High Level Test Scenarios (HLTS) and Low Level Test Cases (LLTC) Excel files, helping testers and stakeholders understand how to navigate, interpret, and maintain these test artifacts.

## HLTS (High Level Test Scenarios) File Structure

The HLTS file contains high-level test scenarios that provide an overview of what needs to be tested across the application. It consists of three main sheets:

### 1. HLTS Readiness Sheet

**Purpose:** Provides a summary of the test readiness status and maps epics to user stories.

**Key Components:**
- **Test Case Traceability Matrix header:** Identifies the document type
- **EPIC - User Story ID mapping:** Shows the relationship between epics (EP-001, EP-002, etc.) and user stories (US-001, US-002, etc.)
- **Figma and Flow references:** Links to design documents and user flows (when populated)

**Usage:**
- Use this sheet to quickly understand the scope of testing and the relationship between epics and user stories
- Reference this sheet when planning test execution or reporting test coverage

### 2. TCM (Test Case Traceability Matrix) Sheet

**Purpose:** Maps test cases to requirements (user stories) and provides essential information about each test case.

**Key Columns:**
- **Test Case ID:** Unique identifier for each test case (e.g., TC_EP-001_US-001_0001)
- **Test Case Descriptions:** Brief description of what the test case verifies
- **User Story ID:** Links the test case to a specific user story (e.g., US-001)
- **Functions:** The functional area being tested (e.g., User Authentication)
- **Test case type:** Indicates whether the test is Positive (P), Negative (N), or Non-Executable (NE)
- **Prerequisite:** Conditions that must be met before executing the test
- **Priority:** Importance of the test case (High, Medium, Low)
- **Matrix:** Additional mapping information

**Usage:**
- Use this sheet to ensure all requirements are covered by test cases
- Reference when planning test execution based on priority
- Track the relationship between test cases and requirements for reporting

### 3. HLTS (High Level Test Scenarios) Sheet

**Purpose:** Provides a detailed matrix of test scenarios mapped to specific test cases.

**Key Components:**
- **Scenario and Test Case Descriptions columns:** List all test scenarios with descriptions
- **Test case type, Prerequisite, Priority columns:** Provide context for each scenario
- **Matrix section:** Shows which test cases (in columns) are associated with which scenarios (in rows)
- **Feature headers (row 2):** Group test cases by feature (e.g., "Log in with Phone number", "User Authentication")
- **Test Case IDs (row 3):** List all test case IDs that scenarios are mapped to

**Usage:**
- Use this sheet to understand the coverage of test scenarios across features
- Identify which scenarios are associated with which test cases
- Plan test execution based on features or scenario groups
- "X" marks in the matrix indicate which test cases implement each scenario

## LLTC (Low Level Test Cases) File Structure

The LLTC file contains detailed test cases with step-by-step instructions. It consists of multiple sheets:

### 1. LLTC Readiness Sheet

**Purpose:** Similar to the HLTS Readiness sheet, provides a summary of test readiness and maps epics to user stories.

**Key Components:**
- **EPIC - User Story ID mapping:** Shows the relationship between epics and user stories
- **Figma and Flow references:** Links to design documents and user flows

**Usage:**
- Use this sheet to quickly understand the scope of detailed testing
- Reference when planning detailed test execution

### 2. Test Execution Plan Sheet

**Purpose:** Provides a framework for planning and tracking test execution.

**Key Components:**
- **Date:** When testing is planned/performed
- **TOTAL PLANNED/TESTED:** Summary counts of test cases
- **TARGET @CHECKPOINT:** Targets for specific times during the day
- **SIT EXECUTION DASHBOARD:** Links to execution tracking
- **Planned/Tested columns:** Track progress for each user story test case set

**Usage:**
- Use this sheet to plan daily test execution
- Track progress against targets
- Report testing status at checkpoints

### 3. Test Execution Dashboard Sheet

**Purpose:** Provides a visual summary of test execution status across all test cases.

**Key Components:**
- **Summary row:** Overall test execution metrics
- **TC_US-XXX rows:** Status breakdown for each user story
- **Status columns:** Tested, Not Start, Pending, Pass, Failed, Not Applicable
- **Formula cells:** Automatically calculate totals based on individual test case sheets

**Usage:**
- Use this sheet to get a quick overview of testing progress
- Identify areas that need attention (high failure rates, low completion)
- Report overall testing status to stakeholders

### 4. TC_US-001 through TC_US-006 Sheets

**Purpose:** Contain detailed test cases for each user story, with step-by-step instructions.

**Key Columns:**
- **TC No.:** Unique identifier for each test case
- **US ID:** User story identifier
- **P/N/NE:** Test type (Positive, Negative, Non-Executable)
- **Priority:** Importance of the test case
- **Test Case Description:** Brief description of what is being tested
- **Prerequisite:** Conditions required before test execution
- **Ts No:** Test step number
- **Test steps Description:** Detailed instruction for each step
- **Expected Result:** What should happen when the step is executed
- **API Testing:** For API-specific test steps
- **Executor, Plan date, Ts Result, TC Result, Test Date, Defect ID:** Execution tracking fields

**Structure:**
- Each test case spans multiple rows
- First row contains test case details
- Subsequent rows contain individual test steps
- Results are tracked at both step and test case levels

**Usage:**
- Use these sheets for detailed test execution
- Record results for each step and the overall test case
- Document defects found during testing
- Track test execution progress

### 5. Master Sheet

**Purpose:** Provides reference data and potentially formulas or macros used across other sheets.

**Usage:**
- Reference this sheet when you need to understand calculations or lookup values
- Do not modify unless you understand the impact on other sheets

## Relationships Between Sheets

1. **Traceability Flow:**
   - HLTS/LLTC Readiness sheets establish the epic-to-user story mapping
   - TCM sheet maps test cases to user stories
   - HLTS sheet maps scenarios to test cases
   - TC_US-XXX sheets provide detailed steps for each test case

2. **Execution Tracking Flow:**
   - TC_US-XXX sheets capture detailed execution results
   - Test Execution Dashboard aggregates results from TC_US-XXX sheets
   - Test Execution Plan helps schedule and track daily progress

## Best Practices for Using the Test Documentation

1. **Maintaining Traceability:**
   - Always use the established ID formats (EP-XXX, US-XXX, TC_EP-XXX_US-XXX_XXXX)
   - Update all related sheets when adding new test cases
   - Ensure test cases are linked to at least one user story

2. **Test Execution:**
   - Start with the Test Execution Plan to prioritize daily testing
   - Record results in the TC_US-XXX sheets as you execute tests
   - Update the Test Execution Dashboard at checkpoints
   - Document defects with clear references to test cases

3. **Reporting:**
   - Use the Test Execution Dashboard for high-level status reporting
   - Reference the TCM for requirement coverage reporting
   - Use the HLTS sheet to report scenario coverage

4. **Maintenance:**
   - When requirements change, update user stories in the Readiness sheets
   - When adding new test cases, update the TCM and HLTS sheets
   - Regularly validate formulas in the Test Execution Dashboard

## Conclusion

This test documentation structure provides a comprehensive framework for planning, executing, and tracking tests for the Salary Hero application. By understanding the purpose and relationships between sheets, testers can efficiently manage the testing process and provide clear status reporting to stakeholders.
