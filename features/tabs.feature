Feature: Set of dishes are present in the DB
    So that users can log in and view dishes sold near them

    Background: dishes, users have been added to database

        Given I have an account with email: "tony@test.com", name: "tony", zipcode: "10029" and password: "test"
        And I have an account with email: "bruce@test.com", name: "bruce", zipcode: "10028" and password: "test"
        And I have an account with email: "buyer@test.com", name: "Buyer", zipcode: "10028" and password: "test"
        And I have a dish with dishname: "Test Dish" and cuisine: "American" and price: "19" and user_email: "tony@test.com"
        And I have a dish with dishname: "Random Dish" and cuisine: "Indian" and price: "25" and user_email: "bruce@test.com"
        And I have a dish with dishname: "Sample Dish" and cuisine: "Chinese" and price: "14" and user_email: "tony@test.com"
        And I have a dish with dishname: "Cheap Dish" and cuisine: "Thai" and price: "10" and user_email: "tony@test.com"
        And I am on the Log In page
        And I fill in "email" with "buyer@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page

    Scenario: User clicks on zipcode tab

        Given I am on the Main page
        And I press "Dishes at 10028"
        Then I should see "Random Dish"
        # And I should see "Today's dishes for you near 10028"
        And I should not see "No items found"

    Scenario: User clicks on cuisine tab

        Given I am on the Main page
        And I press "Thai Dishes"
        Then I should see "Cheap Dish"
        # And I should see "Today's Thai dishes for you"
        And I should not see "No items found"

    Scenario: User clicks on All tab

        Given I am on the Main page
        And I press "All Dishes"
        Then I should see "FILTER BY"
        And I should see "Test Dish"
        And I should see "Random Dish"
        And I should see "Sample Dish"
        And I should see "Cheap Dish"
        