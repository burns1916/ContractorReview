require 'pry'
class ClientsController < ApplicationController

    def new
        @client = Client.new
        @client.build_user
    end

    def create

        @client = Client.new(client_params)
            if @client.save
                @user = @client.user
                session[:user_id] = @user.id
                redirect_to '/'
            else
                render :new
            end
    end

    def show
        @client = Client.find_by_id(params[:id])
    end

    private

    def client_params
        params.require(:client).permit(:name, { user_attributes: [:id, :email, :password] } )
    end
end
