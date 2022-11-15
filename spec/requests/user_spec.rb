require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Users", type: :request do
  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/home/index"
  #     expect(response).to have_http_status(:success)
  #     expect(response.body).to include("Welcome to HoMealy !")
  #   end
  # end


  describe "GET /main" do
    @user = User.new(name: "User", email: "bloop@example.com", password: "abcdef", zipcode: "10027", address: "3153 Broadway")
    @user.save
    it "correct password" do
      post '/login', params: { email: "bloop@example.com", password: "abcdef" }
      get "/home/main"
      expect(response).to have_http_status(:success)
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

  describe "POST/login" do
    @user = User.new(name: "User", email: "bloop@example.com", password: "abcdef", zipcode: "10027", address: "3153 Broadway")
    @user.save
    it "correct password" do
      post '/login', params: { email: "bloop@example.com", password: "abcdef" }
      expect(response).to redirect_to(home_main_path)
    end
    
    it "wrong password" do
      post '/login', params: { session: { email: "bloop@example.com", password: "xxxxxx" } }
      expect(response).to redirect_to(login_path)
    end
  end
end
