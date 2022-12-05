Feature: Set of dishes are present in the DB
    So that users can log in and view dishes sold near them

    Background: dishes, users have been added to database

        Given I have an account with email: "tony@test.com", name: "tony", zipcode: "10029" and password: "test"
        And I have an account with email: "buyer@test.com", name: "Buyer", zipcode: "10030" and password: "test"
        And I have a dish with dishname: "Test Dish" and cuisine: "American" and price: "19" and user_email: "tony@test.com"
        And I am on the Log In page
        And I fill in "email" with "buyer@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page
        And I press "all_button"
        Then I should see "Test Dish"

    Scenario: User tries to buy a dish

        And I should see "Only 5 servings left !"
        And I press "BUY"
        And I press "CONFIRM"
        Then I should see "Only 4 servings left !"

    Scenario: User tries to buy multiple quantities of a dish

        And I should see "Only 5 servings left !"
        And I press "BUY"
        And I select "3" from "quantity"
        And I press "CONFIRM"
        Then I should see "Only 2 servings left !"

    Scenario: User cancels order

        And I should see "Only 5 servings left !"
        And I press "BUY"
        And I select "3" from "quantity"
        And I press "CANCEL"
        Then I should see "Only 5 servings left !"

    Scenario: User orders all available quantities

        And I should see "Only 5 servings left !"
        And I press "BUY"
        And I select "3" from "quantity"
        And I press "CONFIRM"
        And I press "BUY"
        And I select "2" from "quantity"
        And I press "CONFIRM"
        Then I should not see "Test Dish"

        