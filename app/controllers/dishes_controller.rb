class DishesController < ApplicationController
    def create
        @dish = Dish.new(dish_params)
        if @dish.save
            redirect_to home_main_path
        else
            render 'new'
        end
    end

    def new
        return redirect_to login_path, alert: 'You must be logged in to access this page.' if @current_user.nil?
        @dish = Dish.new
    end

    def update
    end

    private 
    
    def dish_params
        params.require(:dish).permit(:dishname, :user_email, :cuisine, :price, :quantity, :description)
    end
end