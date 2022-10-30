require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe UsersController do
    describe "check login functionality" do
        before do
          @user = User.new(name: "User", email: "other@example.com", password: "abcdef", "zipcode": "
          10027")
        end
        let(:found_user) { User.find_by(email: @user.email) }
        describe "with valid password" do
          it { should eq found_user.authenticate(@user.password) }
        end
    end
end

RSpec.describe SessionsController do
end