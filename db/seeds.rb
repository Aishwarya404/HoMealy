# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
dishes = [
    {"dishname": "Fried Rice", "user_email": "aish", "price": 15.8, "quantity": 10, "cuisine": "Chinese", "description": "World's best fried rice!"},
    {"dishname": "Pav Bhaji", "user_email": "aish", "price": 11.5, "quantity": 5, "cuisine": "Indian", "description": "World's best Paaaav!"}
]

dishes.each do |dish|
    curr_dish = Dish.new(dish)
    curr_dish.save!
end