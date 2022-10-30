require 'rails_helper'
require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Dishes", type: :request do
  describe "GET /dishes/new" do
    it "returns http success" do
      get "/dishes/new"
      expect(response).to render_template("layouts/application")
      expect(response).to have_http_status(:success)
    end
  end

  describe "create a new dish" do
    it "successfully creates a dish" do
      get "/dishes/new"
      dish = Dish.create(dishname: "Test dish", user_email: "xyz@gmail.com", "price": 20, "quantity": 5, "cuisine": "Indian")
      expect(response).to have_http_status(:success)
    end
  end
end