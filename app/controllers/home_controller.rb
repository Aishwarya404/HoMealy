class HomeController < ApplicationController
  def main
    return redirect_to login_path, alert: 'You must be logged in to access this page.' if @current_user.nil?
    @dishes = Dish.all
  end
end
