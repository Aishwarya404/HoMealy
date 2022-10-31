require 'simplecov'
SimpleCov.start
require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Dish, type: :model do

  dishes = [
            {"dishname": "French Fries", "user_email": "rosh@gamil.com", "price": 4, "quantity": 8, "cuisine": "Belgian", "description": "Crispy Fries"},
            {"dishname": "Sloppy Joe", "user_email": "sai@gamil.com", "price": 11.5, "quantity": 5, "cuisine": "American", "description": "Yummy burgers"}
  ]
  dishes.each do |dish|
    curr_dish = Dish.new(dish)
    curr_dish.save!
  end
  
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
