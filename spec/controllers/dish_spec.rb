require 'rails_helper'
require 'simplecov'
SimpleCov.start


RSpec.describe DishesController do
  describe "create dish" do
      it "should create" do
        expect {
          post :create, params: { dish: { dishname: "Test dish", user_email: "xyz@gmail.com", price: 20, quantity: 5, cuisine: "Indian" } }
        }.to change{Dish.count}.by(1)
      end
  end
end