require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe UsersController do
	describe "create user" do
    it "should create" do
      expect {
        post :create, params: { user: { name: "User", email: "othr@example.com", password: "abcdef", zipcode: "10027" } }
      }.to change{User.count}.by(1)
    end
  end
end

# RSpec.describe SessionsController do
  # describe "check login functionality" do
  #   before do
  #     @user = User.new(name: "Testuser", email: "test_user@example.com", password: "abcdef", zipcode: "10027")
  #     @user.save!
  #   end
  #   let(:found_user) { User.find_by(email: @user.email) }
	# it "jdfb" do
	# 	puts found_user["zipcode"]
	# end
  #   it { should eq found_user.authenticate(@user.password) }
  # end
  # describe "check user" do
  #   it "should check" do
  #     expect {
  #       post :create, params: { email: "roshan@gmail.com", password: "han"}
  #     }.to redirect_to(home_main_path)
  #   end
  # end
# end



    # it { should validate_presence_of(:email) }
    # it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:password) }
    # it { should validate_uniqueness_of(:email) }