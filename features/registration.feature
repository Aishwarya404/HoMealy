Feature: Gives the user the possibility to create an account to log in later

  As a frequent user
  I don't have to create an account every time
  and so that I can list dishes just by logging in
  I want HoMealy to remember my profile

  Background: on the starting page, un-authenticated

    Given I am on the Home page

  Scenario: create an account

    Then I should see "Satiate your home cooked food cravings!"
    Given I follow "SIGN UP"

    Then I should be on the Sign Up page
    And I should see "Favorite cuisine"
    Given I fill in "user_email" with "test@test.com"
    And I fill in "user_name" with "test"
    And I fill in "user_password" with "test"
    And I fill in "user_zipcode" with "10027"
    And I fill in "user_address" with "520 w 123"
    And I fill in "user_phone" with "917917917"
    And I press "CREATE ACCOUNT"
    Then I should be on the Main page
    And I should see "Dishes for you"

  Scenario: Create an account with Invalid email

    Then I should see "Satiate your home cooked food cravings!"
    Given I follow "SIGN UP"
    Given I have an account with email: "test@test.com", name: "tony" and password: "test"

    Then I should be on the Sign Up page
    Given I fill in "user_email" with "test"
    And I fill in "user_name" with "test"
    And I fill in "user_password" with "test"
    And I fill in "user_zipcode" with "10027"
    And I fill in "user_phone" with "917340340"
    And I press "CREATE ACCOUNT"
    Then I should be on the Sign Up error page
    And I should not see "Dishes for you"
    And I should see "is invalid"

  Scenario: Create an account with Existing email (duplicate check)

    Then I should see "Satiate your home cooked food cravings!"
    Given I have an account with email: "test@test.com", name: "tony" and password: "test"
    Given I follow "SIGN UP"

    Then I should be on the Sign Up page
    Given I fill in "user_email" with "test@test.com"
    And I fill in "user_name" with "test"
    And I fill in "user_password" with "test"
    And I fill in "user_zipcode" with "10027"
    And I fill in "user_phone" with "917340340"
    And I press "CREATE ACCOUNT"
    Then I should be on the Sign Up error page
    And I should not see "Dishes for you"
    And I should see "has already been taken"

  Scenario: Create an account with Invalid phone number

    Then I should see "Satiate your home cooked food cravings!"
    Given I follow "SIGN UP"
    Given I have an account with email: "test@test.com", name: "tony" and password: "test"

    Then I should be on the Sign Up page
    Given I fill in "user_email" with "test@test.com"
    And I fill in "user_name" with "test"
    And I fill in "user_password" with "test"
    And I fill in "user_zipcode" with "10027"
    And I fill in "user_phone" with "abc"
    And I press "CREATE ACCOUNT"
    Then I should be on the Sign Up error page
    And I should see "is not a number"

  Scenario: Create an account with incomplete details

    Then I should see "Satiate your home cooked food cravings!"
    Given I follow "SIGN UP"
    Given I have an account with email: "test@test.com", name: "tony" and password: "test"

    Then I should be on the Sign Up page
    Given I fill in "user_email" with "test@test.com"
    And I fill in "user_name" with "test"
    And I fill in "user_password" with "test"
    And I fill in "user_phone" with "917340340"
    And I press "CREATE ACCOUNT"
    Then I should be on the Sign Up error page
    And I should see "can't be blank" 
