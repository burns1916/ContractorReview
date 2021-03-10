require 'pry'
class ContractorsController < ApplicationController
    
    def new
        @contractor = Contractor.new
        @contractor.build_user
    end

    def create

        @contractor = Contractor.new(contractor_params)
            if @contractor.save
                @user = @contractor.user
                session[:user_id] = @user.id
                redirect_to '/'
            else
                render :new
            end
    end

    def show
        @contractor = Contractor.find_by_id(params[:id])
    end

    private

    def contractor_params
        params.require(:contractor).permit(:business_name, :license_number, { user_attributes: [:id, :email, :password] } )
    end
end
