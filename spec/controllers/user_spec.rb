require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe UsersController do
	describe "create user" do
    it "should create user successfully" do
      expect {
        post :create, params: { user: { name: "User", email: "bloop_user@example.com", password: "abcdef", address: "3153 Broadway, NY", zipcode: "10027", phone: "123456789" } }
      }.to change{User.count}.by(1)
    end

    it "should display errors for name" do
      expect(
        post :create, params: { user: { name: "", email: "bloop@example.com", password: "abcdef", address: "3153 Broadway, NY", zipcode: "10027", phone: "123456789" } }
      ).to render_template("layouts/application")
    end

    it "should display errors for email" do
      expect(
        post :create, params: { user: { name: "User", email: "", password: "abcdef", address: "3153 Broadway, NY", zipcode: "10027", phone: "123456789" } }
      ).to render_template("layouts/application")
    end

    it "should display errors for password" do
      expect(
        post :create, params: { user: { name: "User", email: "bloop@example.com", password: "", address: "3153 Broadway, NY", zipcode: "10027", phone: "123456789" } }
      ).to render_template("layouts/application")
    end

    it "should display errors for address" do
      expect(
        post :create, params: { user: { name: "User", email: "bloop@example.com", password: "abcdef", address: "", zipcode: "", phone: "123456789" } }
      ).to render_template("layouts/application")
    end

    it "should display errors for password" do
      expect(
        post :create, params: { user: { name: "User", email: "bloop@example.com", password: "abcdef", address: "3153 Broadway, NY", zipcode: "10027", phone: "" } }
      ).to render_template("layouts/application")
    end
  end
end