Feature: Set of dishes are present in the DB
    So that users can log in and view dishes sold near them

    Background: dishes, users have been added to database

        Given I have an account with email: "tony@test.com", name: "tony" and password: "test"
        And I am on the Log In page
        And I fill in "email" with "tony@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        And I have a dish with dishname: "Test Dish" and cuisine: "Thai" and price: "19" and user_email: "tony@test.com"
        And I have a dish with dishname: "Random Dish" and cuisine: "Indian" and price: "25" and user_email: "bruce@test.com"
        And I have a dish with dishname: "Sample Dish" and cuisine: "Chinese" and price: "14" and user_email: "tony@test.com"
        And I have a dish with dishname: "Cheap Dish" and cuisine: "Thai" and price: "10" and user_email: "tony@test.com"
        Then I should be on the Main page
        And I should see "Dishes for you"

    Scenario: User searches with seller's name

        Given I am on the Main page
        And I should see "FILTER BY SELLER"
        And I fill in "seller" with "tony"
        And I press "Show search results"
        And I should see "Test Dish"
        And I should see "Sample Dish"
        And I should not see "Random Dish"

    Scenario: User searches with dish name

        Given I am on the Main page
        And I should see "FILTER BY DISHNAME"
        And I fill in "dishname" with "Sample Dish"
        And I press "Show search results"
        And I should see "Sample Dish"
        And I should not see "Random Dish"

    Scenario: User filters with cuisine

        Given I am on the Main page
        And I should see "FILTER BY DISHNAME"
        And I select "Thai" from "cuisine"
        And I press "Show search results"
        Then I should see "Test Dish"
        And I should not see "Sample Dish"
        And I should not see "Random Dish"

    Scenario: User filters with cuisine and seller

        Given I am on the Main page
        And I should see "FILTER BY DISHNAME"
        And I select "Chinese" from "cuisine"
        And I fill in "seller" with "tony"
        And I press "Show search results"
        Then I should see "Sample Dish"
        And I should not see "Test Dish"
        And I should not see "Random Dish"
    
    Scenario: User filters with price

        Given I am on the Main page
        And I should see "FILTER BY PRICE"
        And I select "$10 - $15" from "price"
        And I press "Show search results"
        Then I should see "Cheap Dish"
        And I should see "Sample Dish"
        And I should not see "Test Dish"

