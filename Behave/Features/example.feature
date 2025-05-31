Feature: Payment Process
  Scenario: Check Debit transaction
    Given user is on 'Debit' screen
    When user makes a payment
  Scenario: Check Credit transaction
    Given user is on 'Credit' screen
    When user makes a payment
