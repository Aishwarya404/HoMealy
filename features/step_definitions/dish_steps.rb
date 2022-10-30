
def create_dish(values)
	default_values = {"dishname": "Pav Bhaji", "user_email": "sai@gmail.com", "price": 11.5, "quantity": 5, "cuisine": "Indian", "description": "World's best Paaaav!"}

	values = default_values.merge(values)
	@test_dish = Dish.new values
end


Given /the following dishes exist/ do |dishes_table|
    dishes_table.hashes.each do |dish|
      # each returned element will be a hash whose key is the table header.
      # you should arrange to add that dish to the database here.
      Dish.create(dish)
    end
  end
  
Then /(.*) seed dishes should exist/ do | n_seeds |
    expect(Dish.count).to eq n_seeds.to_i
end