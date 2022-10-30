require 'simplecov'
SimpleCov.start
require 'rails_helper'

RSpec.describe Dish, type: :model do
  
  it "should add two dishes to model" do
    expect(Dish.add_dishes()).to contain_exactly("French Fries", "Sloppy Joe")
  end 
end 
