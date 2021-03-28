require 'pry'
class ContractorsController < ApplicationController
    
    def index
        @contractors = Contractor.all
    end

    def new
        @contractor = Contractor.new
        @contractor.build_user
    end

    def create
        @contractor = Contractor.new(contractor_params)
            if @contractor.save
                @user = @contractor.user
                session[:user_id] = @user.id
                redirect_to @contractor
            else
                render :new
            end
    end

    def update
        @contractor = Contractor.find(params[:id])
        binding.pry
        @contractor.update!(:business_name => params[:contractor][:business_name], :license_number => params[:contractor][:license_number])
        redirect_to @contractor
    end

    def show
        @contractor = Contractor.find_by_id(params[:id])
    end

    private

    def contractor_params
        params.require(:contractor).permit(:business_name, :license_number, { user_attributes: [:id, :email, :password] } )
    end
end
