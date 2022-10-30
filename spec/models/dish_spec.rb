require 'simplecov'
SimpleCov.start
require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Dish, type: :model do
  
  it "should add two dishes to model" do
    expect(Dish.add_dishes()).to contain_exactly("French Fries", "Sloppy Joe")
  end 

  describe "Dish name is empty" do
    before do
      @dish = Dish.new(dishname: "", user_email: "abcd", cuisine: "Indian", "price": 25, "quantity": 3)
    end
    it { should_not be_valid }
  end

  describe "email not following pattern" do
    before do
      @dish = Dish.new(dishname: "Test Dish", user_email: "abcd", cuisine: "Indian", "price": 25, "quantity": 3)
    end
    it { should be_invalid }
  end

end
