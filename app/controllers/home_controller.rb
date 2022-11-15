class HomeController < ApplicationController
  def main
    return redirect_to login_path, alert: 'You must be logged in to access this page.' if @current_user.nil?

    if params[:dishname].nil? or params[:dishname] == ""
      dishname_key = '%%'
    else
      dishname_key = params[:dishname]
    end
    
    if params[:seller].nil? or params[:seller] == ""
      seller_key = '%%'
    else
      seller_key = params[:seller]
    end

    if params[:cuisine].nil? or params[:cuisine] == "All"
      cuisine_key = '%%'
    else
      cuisine_key = params[:cuisine]
    end

    if params[:price].nil? or params[:price] == "All"
      price_key = [0, 1000]
    else
      price_key = params[:price].split(", ").map(&:to_i)
    end

    @user_dish = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email where dishes.dishname like ? and users.name like ? and dishes.cuisine like ? and dishes.price between ? and ?", dishname_key, seller_key, cuisine_key, price_key[0], price_key[1]])
    if @user_dish.length == 0
      @search_error = "No item found"
    end
  end

  def index 
    return redirect_to home_main_path if !@current_user.nil?
  end
end