require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe HomeController do
	describe "buy dish" do
    
    it "should successfully buy dish" do
      @user = User.new(name: "User", email: "bloop@example.com", password: "abcdef", zipcode: "10027", address: "3153 Broadway", phone: "6462881247")
      @user.save
      @dish = Dish.new(dishname: "Test dish", user_email: "bloop@example.com", price: 20, quantity: 5, cuisine: "Indian")
      @dish.save
      session[:email] = @user.email

      put 'buy', params: { quantity: 1, dishname: "Test dish", seller: "User", address: "3153 Broadway", zipcode: "10027", email: "bloop@example.com", phone: "6462881247"}
      expect(response).to redirect_to(home_main_path)

      put 'buy', params: { quantity: 4, dishname: "Test dish", seller: "User", address: "3153 Broadway", zipcode: "10027", email: "bloop@example.com", phone: "6462881247"}
      expect(response).to redirect_to(home_main_path)
    end
  end
end