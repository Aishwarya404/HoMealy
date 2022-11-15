
def create_dish(values)
	default_values = {"dishname": "Pav Bhaji", "user_email": "sample@gmail.com", "price": 11.5, "quantity": 5, "cuisine": "Indian", "description": "World's best Paaaav!"}

	values = default_values.merge(values)
	@test_dish = Dish.new values
end


Given /the following dishes exist/ do |dishes_table|
    dishes_table.hashes.each do |dish|
    	Dish.create(dish)
    end
  end
  
Then /(.*) seed dishes should exist/ do | n_seeds |
    expect(Dish.count).to eq n_seeds.to_i
end

Given /^I have a dish with dishname: "(.*)" and cuisine: "(.*)" and user_email: "(.*)"$/ do |dishname, cuisine, user_email|
	@test_dish =  create_dish({dishname: dishname, user_email: user_email, cuisine: cuisine})
	@test_dish.save!
end