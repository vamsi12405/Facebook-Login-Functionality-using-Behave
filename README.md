# Facebook-Login-Functionality-using-Behave

This project demonstrates how to use [Behave](https://behave.readthedocs.io/en/stable/) (a Python BDD framework) to automate and validate the Facebook login functionality. It covers both **valid** and **invalid** login scenarios.

## Features

- **Valid Login:** Tests successful login with correct credentials.
- **Invalid Login:** Tests failure scenarios with incorrect username or password.

## Project Structure

```
behave_facebook_login/
├── features/
│   ├── facebook_login.feature
│   └── steps/
│       └── facebook_steps.py
├── requirements.txt
└── README.md
```

## Prerequisites

- Python 3.7+
- [pip](https://pip.pypa.io/en/stable/)
- Chrome browser (for Selenium WebDriver)
- [ChromeDriver](https://chromedriver.chromium.org/) installed and in your PATH

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/behave_facebook_login.git
   cd behave_facebook_login
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

## Running the Tests

1. **Configure Test Credentials:**
   - Set valid and invalid login credentials in a `.env` file or directly in your step definitions (not recommended for real credentials).
   - **Never commit real credentials to a public repo!**

2. **Run Behave:**
   ```bash
   behave
   ```

3. **View Results:**
   - Behave will output the test results in the terminal.

## Example Feature File (`facebook_login.feature`)

```gherkin
Feature: Facebook login functionality

  Scenario: Valid login
    Given I am on the Facebook login page
    When I enter a valid username and password
    And I click the login button
    Then I should be redirected to the Facebook home page

  Scenario: Invalid login
    Given I am on the Facebook login page
    When I enter an invalid username or password
    And I click the login button
    Then I should see a login error message
```

## Example Step Implementation (`facebook_steps.py`)

```python
from behave import given, when, then
from selenium import webdriver
from selenium.webdriver.common.by import By

@given('I am on the Facebook login page')
def step_impl(context):
    context.driver = webdriver.Chrome()
    context.driver.get('https://www.facebook.com/')

@when('I enter a valid username and password')
def step_impl(context):
    context.driver.find_element(By.ID, 'email').send_keys('your_valid_email')
    context.driver.find_element(By.ID, 'pass').send_keys('your_valid_password')

@when('I enter an invalid username or password')
def step_impl(context):
    context.driver.find_element(By.ID, 'email').send_keys('invalid_email')
    context.driver.find_element(By.ID, 'pass').send_keys('invalid_password')

@when('I click the login button')
def step_impl(context):
    context.driver.find_element(By.NAME, 'login').click()

@then('I should be redirected to the Facebook home page')
def step_impl(context):
    assert "facebook.com" in context.driver.current_url
    context.driver.quit()

@then('I should see a login error message')
def step_impl(context):
    error_elements = context.driver.find_elements(By.XPATH, "//*[contains(text(), 'incorrect')]")
    assert len(error_elements) > 0
    context.driver.quit()
```

**Note:**  
- Replace `'your_valid_email'` and `'your_valid_password'` with your test account credentials.
- For production or CI, use environment variables or a secrets manager to handle credentials securely.

## License

MIT

---

**Disclaimer:**  
This project is for educational purposes only. Do not use real personal credentials or violate Facebook's terms of service.
