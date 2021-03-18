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

    def destroy
        session.clear
        redirect_to '/'
    end
end
