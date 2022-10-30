Feature: Set of users are present in the DB 
  So that they can log in and create dishes

Background: users have been added to database

  Given the following users exist:
  | name                    | email  | zipcode | password |
  | sairam                  | sai    | 10027   | ram      |
  | aishwarya               | aish   | 10027   | warya    |


  And I am on the Home page
  Then 2 seed users should exist

Scenario: all ratings selected
    Then 2 seed users should exist