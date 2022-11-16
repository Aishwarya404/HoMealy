require 'rails_helper'
require 'simplecov'
SimpleCov.start


RSpec.describe DishesController do
  describe "create dish" do
      it "should create dish successfully" do
        expect {
          post :create, params: { dish: { dishname: "Test Dish", user_email: "bloop@gmail.com", price: 20, quantity: 5, cuisine: "Indian" } }
        }.to change{Dish.count}.by(1)
      end

      it "should display errors for dishname" do
        expect(
          post :create, params: { dish: { dishname: "", user_email: "bloop@gmail.com", price: 20, quantity: 5, cuisine: "Indian" } }
        ).to render_template("layouts/application")
      end

      it "should display errors for price" do
        expect(
          post :create, params: { dish: { dishname: "Test Dish", user_email: "bloop@gmail.com", price: "abc", quantity: 5, cuisine: "Indian" } }
        ).to render_template("layouts/application")
      end

      it "should display errors for quantity" do
        expect(
          post :create, params: { dish: { dishname: "Test Dish", user_email: "bloop@gmail.com", price: 20, quantity: "" , cuisine: "Indian" } }
        ).to render_template("layouts/application")
      end

      it "should display errors for cuisine" do
        expect(
          post :create, params: { dish: { dishname: "", user_email: "bloop@gmail.com", price: 20, quantity: 5, cuisine: "" } }
        ).to render_template("layouts/application")
      end
  end
end