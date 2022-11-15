Feature: Set of dishes are present in the DB
    So that users can log in and view dishes sold near them

    Background: dishes have been added to database

        Given the following dishes exist:
        | dishname   | user_email     | price | quantity | cuisine | description           |
        | Pav Bhaji  | sai@gmail.com  | 20    | 20       | Indian  | With butter and chana |
        | Fried Rice | aish@gmail.com | 15    | 10       | Chinese | With sauces           |

        And I have an account with email: "sample@test.com", name: "tony" and password: "test"
        And I am on the Log In page
        And I fill in "email" with "sample@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page
        And I should see "Dishes for you"

    Scenario: User logs in and sees the available dishes

        Given I am on the Main page
        Then I should see "Dishes for you"

    Scenario: User tries to list a new dish for sale
        Given I am on the Main page
        And I follow "ADD A NEW DISH"
        Then I should be on the Add Dish page
        And I should see "Please enter following information for your dish"

    Scenario: User tries to see information of an existing dish
        Given I have a dish with dishname: "Test Dish" and cuisine: "Thai" and price: "20" and user_email: "sample@test.com"
        And I am on the Main page
        Then I should see "Test Dish"

    Scenario: User tries to fill in details for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I fill in "dish_quantity" with "5"
        And I fill in "dish_cuisine" with "Thai"
        And I press "Upload Dish"
        Then I should be on the Main page
        And I should see "Pad Thai"
        And I should see "Only 5 servings left!"

    Scenario: User tries to fill in incorrect details for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I fill in "dish_cuisine" with "Thai"
        And I press "Upload Dish"
        Then I should be on the Add Dish error page
        And I should not see "Dishes for you"
        And I should see "can't be blank"
    
    Scenario: User tries to fill in incorrect price/quantity for a new dish
        Given I am on the Add Dish page
        And I fill in "dish_dishname" with "Pad Thai"
        And I fill in "dish_price" with "20"
        And I fill in "dish_cuisine" with "Thai"
        And I fill in "dish_quantity" with "abc"
        And I press "Upload Dish"
        Then I should be on the Add Dish error page
        And I should not see "Dishes for you"
        And I should see "is not a number"

    Scenario: Email pre-populated when user tries to list new dish
        Given I am on the Main page
        And I follow "ADD A NEW DISH"
        Then I should be on the Add Dish page
        And I should see "tony"
