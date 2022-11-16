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
    {"dishname": "Fried Rice", "user_email": "aish@gmail.com", "price": 15.8, "quantity": 10, "cuisine": "Chinese", "description": "World's best fried rice!"},
    {"dishname": "Pav Bhaji", "user_email": "sai@gmail.com", "price": 11.5, "quantity": 5, "cuisine": "Indian", "description": "World's best Paaaav!"}
]

dishes.each do |dish|
    curr_dish = Dish.new(dish)
    curr_dish.save!
end


users = [
    {"email": "sai@gmail.com", "password": "ram", "phone": "9173409876", "name": "sairam", "favorite_cuisine": "Thai", "address": "3153 Broadway, Apt 5", "zipcode": "10027"},
    {"email": "aish@gmail.com", "password": "warya", "phone": "6462881247", "name": "aishwarya", "favorite_cuisine": "Indian", "address": "520 W, 123rd street", "zipcode": "10027"},
]

users.each do |user|
    curr_user = User.new(user)
    curr_user.save!
end