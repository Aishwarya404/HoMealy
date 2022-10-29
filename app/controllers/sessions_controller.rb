class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        if !!@user && @user.authenticate(params[:password])
            session[:email] = @user.email
            redirect_to home_main_path
        else
            message = "Check your entered info"
            redirect_to login_path, notice: message
        end
    end
end