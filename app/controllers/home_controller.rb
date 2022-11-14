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

    @user_dish = Dish.find_by_sql(["SELECT * from dishes INNER JOIN users on dishes.user_email = users.email where dishes.dishname like ? and users.name like ? and dishes.cuisine like ?", dishname_key, seller_key, cuisine_key])
    if @user_dish.length == 0
      @search_error = "No item found"
    end
  end
end