class ContractorsController < ApplicationController
    
    def new
        @ccontractor = Contractor.new
    end

    def create
        @contractor = Contractor.new(contractor_params)
            if @contractor.save
                redirect_to :show
            else
                render :new
            end
    end

    private

    def contractor_params
        params.require(:contractor).permit(:business_name, :license_number, user_attributes: [:id, :email, :password])
    end
end
