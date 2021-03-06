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
                if params["status"]["high_to_low"]
                    @reviews = Review.high_to_low
                elsif params["status"]["low_to_high"]
                    @reviews = Review.low_to_high
                end
        end
    end

    def new
        @appointment = Appointment.find_by_id(params[:appointment_id])
        if params[:appointment_id] && Appointment.find_by_id(params[:appointment_id])
            if @appointment.review
                flash[:message] = "You already reviewed this appointment"
                redirect_to @appointment.review
            else
                @review = @appointment.build_review
            end
        else
            @error = flash[:message] = "That appointment doesn't exist" if params[:appointment_id]
            @review = Review.new
        end
    end

    def create
        @appointment = Appointment.find_by_id(params[:review][:appointment_id])
        if @appointment.review != nil
            flash[:message] = "You already reviewed this appointment"
            redirect_to @appointment.review
        else
            @review = Review.new(review_params)
            if @review.save
                redirect_to @review
            else
                render :new 
            end
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :appointment_id)
    end
end
