Feature: Profile page visible for users
    So that users can log in and view their profile information and dishes they're selling

    Background: dishes have been added to database

         Given the following dishes exist:
        | dishname   | user_email     | price | quantity | cuisine | description           |
        | Pav Bhaji  | sai@gmail.com  | 20    | 20       | Indian  | With butter and chana |
        | Fried Rice | aish@gmail.com | 15    | 10       | Chinese | With sauces           |
        
        And I have an account with email: "sample@test.com", name: "Tony", zipcode: "10029" and password: "test"
        And I have an account with email: "bruce@test.com", name: "bruce", zipcode: "10028" and password: "test"
        And I have a dish with dishname: "Bruce's Dish" and cuisine: "Indian" and price: "25" and user_email: "bruce@test.com"
        And I have a dish with dishname: "Tony's Dish" and cuisine: "American" and price: "15" and user_email: "sample@test.com"
        And I am on the Log In page
        And I fill in "email" with "sample@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page

    Scenario: User tries to navigate to the profile page
        Given I am on the Main page
        And I follow "profile"
        Then I should be on the Profile page
        And I should see "MY PROFILE"
    
    Scenario: User's contact information should be visible
        Given I am on the Profile page
        Then I should see "Tony"
        And I should see "sample@test.com"
        And I should see "520 w 123"
        And I should see "9179179171"
    
    Scenario: The dishes a user is selling should be visible
        Given I am on the Profile page
        Then I should see "Tony's Dish"
        And I should see "CUISINE : American"
        And I should see "PRICE : $15"
        And I should see "PORTIONS REMAINING : 5"

        Then I should not see "Bruce's Dish"
        And I should not see "CUISINE : Indian"
        And I should not see "PRICE : $25"
    
    Scenario: User should be able to see previously sold dishes
        Given I follow "logout"
        And I follow "LOG IN"
        And I fill in "email" with "bruce@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page
        And I press "BUY"
        And I select "5" from "quantity"
        And I press "CONFIRM"
        Then I should not see "Tony's Dish"
        And I follow "logout"
        And I follow "LOG IN"
        And I fill in "email" with "sample@test.com"
        And I fill in "password" with "test"
        And I press "LOG IN"
        Then I should be on the Main page
        And I follow "profile"
        Then I should see "Sold Dishes"
        And I should see "Tony's Dish"
        And I should see "PRICE : $15"

    Scenario: User should be able to navigate back to the home page
        Given I am on the Profile page
        And I follow "homepage"
        Then I should be on the Main page
        And I should see "All Dishes"
