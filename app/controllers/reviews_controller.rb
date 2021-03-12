class ReviewsController < ApplicationController
    before_action :require_login

    def index
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @reviews = @client.reviews
        elsif params[:contractor_id] && @contractor = Contractor.find_by_id(params[:contractor_id])
            @reviews = @contractor.reviews
        else
            @error = flash[:message] = "Client and/or Contractor has no Reviews" if params[:client_id] || params[:contractor_id]
            @reviews = Review.all
        end
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
            if @review.save
                redirect_to @review
            else
                render :new 
            end
    end

    def show

    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :appointment_id)
    end
end
