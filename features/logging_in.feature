Feature: Validates user log in info.

  As a frequent user
  I should be able to log in after entering my credentials.
  I should not be able to log in with incorrect information.

Background: on the starting page, un-authenticated

  Given I am on the Home page
  And I have an account with email: "test@test.com" and password: "test"
  And I follow "LOG IN"
  And I fill in "email" with "test@test.com"

#   And I am not authenticated

Scenario: Signing in with correct credentials

  And I fill in "password" with "test"
  And I press "LOG IN"
  Then I should see "Logged in as test"

Scenario: signing in with wrong credentials

  And I fill in "password" with "wrongpassword"
  And I press "LOG IN"
  Then I should not see "Logged in as"

# Scenario: Logging out
#   And I fill in "password" with "test"
#   And I press "LOG IN"
#   Then I should see "Logged in as test"
#   And I follow "Log Out"
#   Then I should see "Welcome to HoMealy"
#   And I should not see "Logged in as"



