class UserMailer < ApplicationMailer
    default from: 'shiva.aishwarya97@gmail.com'

    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to HoMealy')
    end
end
