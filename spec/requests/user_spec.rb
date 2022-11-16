require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Users", type: :request do

  describe "POST /login" do
    @user = User.new(name: "User", email: "bloop@example.com", password: "abcdef", zipcode: "10027", phone: 6462881247, address: "3153 Broadway")
    @user.save
    it "correct password" do
      post '/login', params: { email: "bloop@example.com", password: "abcdef" }
      expect(response).to redirect_to(home_main_path)

      get "/home/main"
      expect(response).to have_http_status(:success)

      get "/home/main?seller=Sairam&dishname=Pav+bhaji&cuisine=Indian&price=10%2C+15&commit=Show+search+results"
      expect(response).to have_http_status(:success)

      get '/home/index'
      expect(response).to redirect_to(home_main_path)
    end

    it "incorrect password" do
      post '/login', params: { email: "bloop@example.com", password: "abcd" }
      expect(response).to redirect_to(login_path)
    end
  end
  
  describe "GET /signup" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /signout" do
    it "returns http success" do
      get "/logout"
      expect(response).to redirect_to(home_index_path)
    end
  end
end
