require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe User, type: :model do
  
  describe "when password is not present" do
    before do
      @user = User.new(zipcode: "10027", name: "Test User", email: "other@example.com", password: " ")
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before do
      @user = User.new(zipcode: "10027", name: "Test User", email: "other@example.com", password: "aaaaa")
    end
    it { should be_invalid }
  end

  describe "email not following pattern" do
    before do
      @user = User.new(zipcode: "10027", name: "Test User", email: "abcd", password: "aaaaa")
    end
    it { should be_invalid }
  end
end
