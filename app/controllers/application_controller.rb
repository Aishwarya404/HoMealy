class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def current_user
        @current_user ||= User.find(session[:email]) if session[:email]
    end

    # def authorize
    #     redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
    # end

    # before_action :authorize, except: [:root_path]
end
