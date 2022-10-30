Feature: Gives the user the possibility to create an account to log in later

  As a frequent user
  I don't have to create an account every time
  and so that I can list dishes just by logging in
  I want HoMealy to remember my profile

Background: on the starting page, un-authenticated

  Given I am on the Home page
#   And I am not authenticated

Scenario: create an account

  Then I should see "Welcome"
  Given I follow "SIGN UP"

#   Then I should be on the Sign Up page
  Then I should see "This is SIGN UP"
  Given I fill in "user_email" with "test@test.com"
  And I fill in "user_name" with "test"
  And I fill in "user_password" with "test"
  And I fill in "user_zipcode" with "10027"
  And I press "Create Account"
  Then I should see "This is LOG IN"

Scenario: signing in

  Given I have an account with email: "test@test.com" and password: "test"
  And I follow "LOG IN"
  And I fill in "email" with "test@test.com"
  And I fill in "password" with "test"
  And I press "LOG IN"
  Then I should see "Dishes"

Scenario: signing in with wrong credentials

  Given I have an account with email: "test@test.com" and password: "test"
  And I follow "LOG IN"
  And I fill in "email" with "test@test.com"
  And I fill in "password" with "wrongpassword"
  And I press "LOG IN"
  Then I should not see "Dishes"







