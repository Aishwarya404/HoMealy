require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Welcome to HoMealy !")
    end
  end

  # describe "GET /login" do
  #   before do
  #     @user = User.new(name: "Other User", email: "other@example.com", password: "abcdef", "zipcode": "
  #     10027")
  #   end
  #   let(:found_user) { User.find_by(email: @user.email) }
  #   # it "returns http success" do
  #   #   get "/login"
  #   #   expect(response).to have_http_status(:success)
  #   # end
  #   describe "with valid password" do
  #     it { should eq found_user.authenticate(@user.password) }
  #   end
  # end

  describe "GET /signup" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /main" do
    it "returns http success" do
      get "/home/main"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /signout" do
    it "returns http success" do
      get "/logout"
      expect(response).to redirect_to(home_index_path)
    end
  end

  # describe "POST/login" do
  #   # before do
  #   #   @user = User.new(name: "User", email: "bloop@example.com", password: "abcdef", zipcode: "10027")
  #   #   @user.save!
  #   # end
  #   it "redirects the user" do
  #     post '/login', params: { session: { email: "sai@gmail.com", password: "ram" } }
  #     puts response.inspect
  #     expect(response).to redirect_to(login_path)

  #     # post :create, params: { user: { name: "User", email: "othr@example.com", password: "abcdef", zipcode: "10027" } }
  #     # follow_redirect!
  #     # expect(response.body).to include("You have been signed in")
  #   end
  # end

end
