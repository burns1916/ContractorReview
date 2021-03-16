class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :client_user, :contractor_user

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def require_login
        unless current_user
            redirect_to root_url
        end
    end

    def logged_in?
        !!current_user
    end

    def client_user
        if current_user && current_user.meta_type == "Client"
            @client = Client.find_by(:id => current_user.meta.id)
        end
    end

    def contractor_user
        if current_user && current_user.meta_type == "Contractor"
            @contractor = Contractor.find_by(:id => current_user.meta.id)
        end
    end

end
