require 'pry'
class AppointmentsController < ApplicationController
    before_action :require_login

    def index
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @appointments = @client.appointments
        elsif params[:contractor_id] && @contractor = Contractor.find_by_id(params[:contractor_id])
            @appointments = @contractor.appointments
        else
            @error = flash[:message] = "Client and/or Contractor has no Appointments" if params[:client_id] || params[:contractor_id]
            @appointments = Appointment.all
        end
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = current_user.meta.appointments.build(appointment_params)
        if @appointment.save
            redirect_to @appointment
        else
            render :new
        end
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:job_name, :job_description, :appointment_time, :client_id, :contractor_id)
    end
end
