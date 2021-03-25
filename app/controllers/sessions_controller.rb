require 'pry'
class SessionsController < ApplicationController


    def new
        @user = User.new
    end

    def create
        user = User.find_by(:email => params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            if client_user
                redirect_to @client
            elsif contractor_user
                redirect_to @contractor
            end
        else
            flash[:message] = "Login information was incorrect."
            render :new
        end
    end

    def googlelogin
        if auth_type = "client"
            @user = User.find_or_create_by(:email => auth["info"]["email"]) do |user|
                user.password = SecureRandom.hex(10)
                user.meta_type = "Client"
            end
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to @user
                else
                    render :new
                end
        end
    end

    def auth
        request.env["omniauth.auth"]
    end

    def auth_type
        request.env["omniauth.params"]["user"]
    end

    def destroy
        session.clear
        redirect_to '/'
    end
end
