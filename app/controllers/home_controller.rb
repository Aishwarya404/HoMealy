class HomeController < ApplicationController
  def main
    return redirect_to login_path, alert: 'You must be logged in to access this page.' if @current_user.nil?
    @dishes = Dish.all
    @user_dish = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email"])
  end
end
