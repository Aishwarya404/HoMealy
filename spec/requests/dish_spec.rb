require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Dishes", type: :request do
  describe "GET /dishes/new" do
    it "redirect to login if not logged in" do
      get "/dishes/new"
      expect(response).to redirect_to(login_path)
    end

    @user = User.new(name: "User", email: "bloop1@example.com", password: "abcdef", address: "3153 Broadway", zipcode: "10027", phone: "6462881247")
    @user.save

    it "correct password" do
      post '/login', params: { email: "bloop1@example.com", password: "abcdef" }
      expect(response).to redirect_to(home_main_path)
      get "/dishes/new"
      expect(response).to render_template("layouts/application")
      expect(response).to have_http_status(:success)
    end
  end
end