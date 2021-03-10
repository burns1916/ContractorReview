class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to '/'
    end
end
