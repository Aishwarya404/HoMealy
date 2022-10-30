Feature: Gives the user the possibility to create an account to log in later

  As a frequent user
  I don't have to create an account every time
  and so that I can list dishes just by logging in
  I want HoMealy to remember my profile

Background: on the starting page, un-authenticated

  Given I am on the Home page
#   And I am not authenticated

Scenario: create an account

  Then I should see "Welcome to HoMealy"
  Given I follow "SIGN UP"

#   Then I should be on the Sign Up page
  Then I should see "This is SIGN UP"
  Given I fill in "user_email" with "test@test.com"
  And I fill in "user_name" with "test"
  And I fill in "user_password" with "test"
  And I fill in "user_zipcode" with "10027"
  And I press "Create Account"
  Then I should see "This is LOG IN"

Scenario: Create an account with Invalid email

  Then I should see "Welcome"
  Given I follow "SIGN UP"
  Given I have an account with email: "test@test.com" and password: "test"

  Then I should see "This is SIGN UP"
  Given I fill in "user_email" with "test"
  And I fill in "user_name" with "test"
  And I fill in "user_password" with "test"
  And I fill in "user_zipcode" with "10027"
  And I press "Create Account"
  Then I should not see "This is LOG IN"   
  And I should see "SIGN UP"
  #To Do : Add Error text

Scenario: Create an account with Existing email (duplicate check)

  Then I should see "Welcome"
  Given I have an account with email: "test@test.com" and password: "test"
  Given I follow "SIGN UP"

  Then I should see "This is SIGN UP"
  Given I fill in "user_email" with "test@test.com"
  And I fill in "user_name" with "test"
  And I fill in "user_password" with "test"
  And I fill in "user_zipcode" with "10027"
  And I press "Create Account"
  Then I should not see "This is LOG IN"   
  And I should see "SIGN UP"
  #To Do : Add Error text








