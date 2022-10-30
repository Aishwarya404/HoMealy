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

  describe "GET /login" do
    before do
      @user = User.new(name: "Other User", email: "other@example.com", password: "abcdef", "zipcode": "
      10027")
    end
    let(:found_user) { User.find_by(email: @user.email) }
    # it "returns http success" do
    #   get "/login"
    #   expect(response).to have_http_status(:success)
    # end
    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end
  end

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



end
