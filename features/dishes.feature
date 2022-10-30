Feature: Set of dishes are present in the DB 
  So that users can log in and view dishes sold near them

Background: dishes have been added to database

    Given the following dishes exist:
    | dishname          | user_email       | price | quantity | cuisine        | description                |       
    | Pav Bhaji         | sai@gmail.com    | 20    | 20       | Indian         | With butter and chana      |
    | Fried Rice        | aish@gmail.com   | 15    | 10       | Chinese        | With sauces                |

    And I have an account with email: "test@test.com" and password: "test"
    And I am on the Main page   
    Then I should see "Dishes"          
    And 2 seed dishes should exist

Scenario: User logs in and sees the available dishes

    Given I am on the Main page
    Then I should see "Dishes"
    And I should see "Pav Bhaji"

Scenario: User tries to list a new dish for sale
    Given I am on the Main page
    And I follow "ADD A DISH"
    Then I should see "ADD A NEW DISH"

Scenario: User tries to fill in details for a new dish
    Given I am on the Add Dish page
    And I fill in "dish_dishname" with "Pad Thai"
    And I fill in "dish_user_email" with "test@test.com"
    And I fill in "dish_price" with "20"
    And I fill in "dish_quantity" with "5"
    And I fill in "dish_cuisine" with "Thai"
    And I press "Upload Dish"
    Then I should see "Dishes for you"
    And I should see "Pad Thai"

Scenario: User tries to fill in incorrect details for a new dish
    Given I am on the Add Dish page
    And I fill in "dish_dishname" with "Pad Thai"
    And I fill in "dish_user_email" with "test"
    #To do : add error text
    And I fill in "dish_price" with "20"
    And I fill in "dish_quantity" with "5"
    And I fill in "dish_cuisine" with "Thai"
    And I press "Upload Dish"
    Then I should not see "Dishes for you"
    And I should see "This is TO ADD A NEW DISH"