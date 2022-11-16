class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).welcome_email.deliver_now
            session[:email] = @user.email
            redirect_to home_main_path
        else
            render 'new'
        end
    end

    def new
        return redirect_to home_main_path if !@current_user.nil?
        @user = User.new
    end

    private 
    
    def user_params
        params.require(:user).permit(:email, :password, :phone, :name, :favorite_cuisine, :address, :zipcode)
    end
end