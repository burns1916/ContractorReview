class ContractorsController < ApplicationController
    
    def new
        @contractor = Contractor.new
    end

    def create
        @contractor = Contractor.new(contractor_params)
            if @contractor.save
                redirect_to :show
            else
                render :new
            end
    end

    def show

    end

    private

    def contractor_params
        params.require(:contractor).permit(:business_name, :license_number, user_attributes: [:id, :email, :password])
    end
end
