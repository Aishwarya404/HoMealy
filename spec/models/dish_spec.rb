# require 'simplecov'
# SimpleCov.start

require 'rails_helper'

RSpec.describe Dish, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should add two dishes to model" do
    expect(Dish.add_dishes()).to contain_exactly("French Fries", "Sloppy Joe")
  end 
end 
