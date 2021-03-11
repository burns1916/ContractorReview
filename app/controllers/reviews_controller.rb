class ReviewsController < ApplicationController
    before_action :require_login

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
