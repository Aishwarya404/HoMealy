require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe "Users", type: :request do

  describe "POST /login" do
    @user = User.new(name: "User", email: "bloop2@example.com", password: "abcdef", address: "3153 Broadway", zipcode: "10027", phone: "6462881247")
    @user.save

    @dish = Dish.new(dishname: "Test dish", user_email: "bloop2@example.com", price: 20, quantity: 5, cuisine: "Indian")
    @dish.save
    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      expect(response).to redirect_to(home_main_path)
    end 

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get "/home/main"
      expect(response).to have_http_status(:success)
    end

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get "/home/main?seller=User&commit=Show+search+results"
      expect(response).to have_http_status(:success)
    end

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get "/home/main?seller=User&dishname=Test+Dish&commit=Show+search+results"
      expect(response).to have_http_status(:success)
    end

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get "/home/main?seller=User&dishname=Test+Dish&cuisine=Indian&commit=Show+search+results"
      expect(response).to have_http_status(:success)
    end

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get "/home/main?seller=User&dishname=Test+Dish&cuisine=Indian&price=15%2C+20&commit=Show+search+results"
      expect(response).to have_http_status(:success)
    end

    it "correct password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcdef" }
      get '/home/index'
      expect(response).to redirect_to(home_main_path)
    end

    it "incorrect password" do
      post '/login', params: { email: "bloop2@example.com", password: "abcd" }
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
