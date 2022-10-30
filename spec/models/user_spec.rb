require 'rails_helper'

RSpec.describe User, type: :model do
  it "should fetch user from zipcode" do
    expect(User.add_users()).to contain_exactly("sairam")
  end
end
