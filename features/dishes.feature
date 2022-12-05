Feature: Set of dishes are present in the DB
    So that users can log in and view dishes sold near them

    Background: dishes have been added to database

         Given the following dishes exist:
        | dishname   | user_email     | price | quantity | cuisine | description           |
        | Pav Bhaji  | sai@gmail.com  | 20    | 20       | Indian  | With butter and chana |
        | Fried Rice | aish@gmail.com | 15    | 10       | Chinese | With sauces           |
        
        And I have an account with email: "sample@test.com", name: "tony", zipcode: "10029" and password: "test"
        And I have an account with email: "bruce@test.com", name: "bruce", zipcode: "10028" and password: "test"
        And I have a dish with dishname: "Random Dish" and cuisine: "Indian" and price: "25" and user_email: "bruce@test.com"
        And I am on the Log In page
        And I fill in "email" with "sample@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page

    Scenario: User tries to list a new dish for sale
        Given I am on the Main page
        And I follow "SELL A DISH"
        Then I should be on the Add Dish page
        And I should see "Please enter following information for your dish"

    Scenario: User tries to see information of an existing dish
        And I am on the Main page
        Then I should see "Random Dish"

    Scenario: User tries to fill in details for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I fill in "dish_quantity" with "5"
        And I select "Thai" from "dish_cuisine"
        And I press "UPLOAD DISH"
        Then I should be on the Main page
        And I should not see "Pad Thai"

    Scenario: User tries to fill in incorrect details for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I select "Thai" from "dish_cuisine"
        And I press "UPLOAD DISH"
        Then I should be on the Add Dish error page
        And I should not see "Dishes for you"
        And I should see "can't be blank"
    
    Scenario: User tries to fill in incorrect price/quantity for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I select "Thai" from "dish_cuisine"
        And I fill in "dish_quantity" with "abc"
        And I press "UPLOAD DISH"
        Then I should be on the Add Dish error page
        And I should not see "Dishes for you"
        And I should see "is not a number"

