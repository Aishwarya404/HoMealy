require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe User, type: :model do
  # User.destroy_all
  # users = [
  #         {"email": "rosh@gmail.com", "password_digest": "rosh", "name": "roshan", "zipcode": "0000"},
  #         {"email": "nandu1@gmail.com", "password_digest": "nand", "name": "nandu", "zipcode": "9999"},
  #         ]
  # users.each do |user|
  #   curr_user = User.new(user)
  #   curr_user.save!
  # end
  
  # it "should fetch user from zipcode" do  
  #   expect(User.add_users()).to contain_exactly("roshan")
  # end
  
  # describe "when password is not present" do
  #   before do
  #     @user = User.new(zipcode: "10027", name: "Test User", email: "other@example.com", password: " ")
  #   end
  #   it { should_not be_valid }
  # end

  # describe "with a password that's too short" do
  #   before do
  #     @user = User.new(zipcode: "10027", name: "Test User", email: "other@example.com", password: "aaaaa")
  #   end
  #   it { should be_invalid }
  # end

  # describe "email not following pattern" do
  #   before do
  #     @user = User.new(zipcode: "10027", name: "Test User", email: "abcd", password: "aaaaa")
  #   end
  #   it { should be_invalid }
  # end
end
