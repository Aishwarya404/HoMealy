Feature: Validates user log in info.

  As a frequent user
  I should be able to log in after entering my credentials.
  I should not be able to log in with incorrect information.

Background: on the starting page, un-authenticated

  Given I am on the Home page
  And I have an account with email: "test@test.com", name: "tony" and password: "test"
  And I follow "LOG IN"
  Then I should be on the Log In page
  And I fill in "email" with "test@test.com"

Scenario: Signing in with correct credentials

  And I fill in "password" with "test"
  And I press "LOG IN"
  Then I should be on the Main page
  And I should see "Logged in as tony"
  

Scenario: signing in with wrong credentials

  And I fill in "password" with "wrongpassword"
  And I press "LOG IN"
  Then I should be on the Log In page
  And I should not see "Logged in as"

Scenario: Logging out
  And I fill in "password" with "test"
  And I press "LOG IN"
  Then I should see "Logged in as tony"
  And I follow "logout"
  Then I should see "HoMealy"
  And I should not see "Logged in as"



