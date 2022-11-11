class ApplicationController < ActionController::Base
    helper_method :current_user, :authorize
    before_action :current_user

    def current_user
        @current_user ||= User.find(session[:email]) if session[:email]
    end

    # def authorize
    #     redirect_to home_index_path, alert: 'You must be logged in to access this page.' if @current_user.nil?
    # end
end
