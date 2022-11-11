require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe UsersController do
	describe "create user" do
    it "should create" do
      expect {
        post :create, params: { user: { name: "User", email: "othr@example.com", phone: 123456789, password: "abcdef", zipcode: "10027", address: "3153 Braodway, NY" } }
      }.to change{User.count}.by(1)
    end

    it "should display errors" do
      expect(
        post :create, params: { user: { name: "", email: "othr@example.com", password: "abcdef", zipcode: "10027" } }
      ).to render_template("layouts/application")
    end
  end
end