class UserMailer < ApplicationMailer
    default from: 'shiva.aishwarya97@gmail.com'

    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to HoMealy')
    end

    def buyer_confirmation_email
        @quantity = params[:quantity]
        @dishname = params[:dishname]
        @seller = params[:seller]
        @seller_address = params[:seller_address]
        @seller_zipcode = params[:seller_zipcode]
        @seller_phone = params[:seller_phone]
        @user = params[:user]
        mail(to: @user.email, subject: 'Your order is confirmed!')
    end

    def seller_confirmation_email
        @quantity = params[:quantity]
        @dishname = params[:dishname]
        @seller = params[:seller]
        @seller_email = params[:seller_email]
        @user = params[:user]
        mail(to:@seller_email, subject: 'Your buyer is on the way!')
    end
end
