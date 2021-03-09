class ClientsController < ApplicationController

    def new
        @client = Client.new
    end

    def create
        raise params.inspect
        @client = Client.new(client_params)
            if @client.save
                redirect_to :show
            else
                render :new
            end
    end

    def show

    end

    private

    def client_params
        params.require(:client).permit(:name, user_attributes: [:id, :email, :password])
    end
end
