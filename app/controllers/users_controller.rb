class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            session[:email] = @user.email
            redirect_to login_path
        end
    end

    def new
        @user = User.new
    end

    private 
    
    def user_params
        params.require(:user).permit(:email, :name, :password, :zipcode)
    end
end