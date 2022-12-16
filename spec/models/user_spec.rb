require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone) }
end
