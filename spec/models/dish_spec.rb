require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Dish, type: :model do
  it { should validate_presence_of(:dishname) }
  it { should validate_presence_of(:user_email) }
  it { should validate_presence_of(:cuisine) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity) }
  it { should validate_numericality_of(:price) }
end
