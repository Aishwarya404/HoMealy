class DishesController < ApplicationController
    def create
        @dish = Dish.new(dish_params)
        if @dish.save
            redirect_to home_main_path
        end
    end

    def new
        @dish = Dish.new
    end

    private 
    
    def dish_params
        params.require(:dish).permit(:dishname, :user_email, :cuisine, :price, :quantity, :description)
    end
end