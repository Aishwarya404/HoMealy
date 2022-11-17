# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Dish.destroy_all
User.destroy_all

dishes = [
    {"dishname": "Fried Rice", "user_email": "as6418@columbia.edu", "price": 15.8, "quantity": 10, "cuisine": "Chinese", "description": "Fried rice with 2 eggs, sauteed in sliced garlic, carrots, onions, capsicum and more."},
    {"dishname": "Pav Bhaji", "user_email": "sh4188@columbia.edu", "price": 11.5, "quantity": 5, "cuisine": "Indian", "description": "Pav Bhaji that melts in your mouth, served with mashed vegeatables topped with butter!"},
    {"dishname": "Chicken Biryani", "user_email": "sh4188@columbia.edu", "price": 8.5, "quantity": 8, "cuisine": "Indian", "description": "Chicken Biryani woohoo!"}
]

dishes.each do |dish|
    curr_dish = Dish.new(dish)
    curr_dish.save!
end


users = [
    {"email": "as6418@columbia.edu", "password": "abcdef", "phone": "9173409876", "name": "Sairam", "favorite_cuisine": "Thai", "address": "3153 Broadway, Apt 5", "zipcode": "10027"},
    {"email": "sh4188@columbia.edu", "password": "abcdef", "phone": "6462881247", "name": "Aishwarya", "favorite_cuisine": "Indian", "address": "520 W, 123rd street", "zipcode": "10027"},
]

users.each do |user|
    curr_user = User.new(user)
    curr_user.save!
end