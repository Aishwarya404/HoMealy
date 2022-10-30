Feature: Set of users are present in the DB 
  So that they can log in and create dishes

Background: users have been added to database

  Given the following users exist:
  | name                    | email  | zipcode | password |
  | sairam                  | sai@gmail.com    | 10027   | ram      |
  | aishwarya               | aish@gmail.com   | 10027   | warya    |


  And I am on the Home page
  Then 2 seed users should exist

Scenario: users created
    Then 2 seed users should exist