class HomeController < ApplicationController
  def main
    return redirect_to login_path, alert: 'You must be logged in to access this page.' if @current_user.nil?
    @dishes = Dish.all
    @user_dish = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email"])
    @current_zipcode = User.find_by_sql(["SELECT zipcode from users where users.email = ?", @current_user])[0].zipcode
    @current_cuisine = User.find_by_sql(["SELECT favorite_cuisine from users where users.email = ?", @current_user])[0].favorite_cuisine
    @user_dish_zipcode = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email where users.zipcode = ?", @current_zipcode])
    @user_dish_cuisine = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email where dishes.cuisine = ?", @current_cuisine])
  end
end
