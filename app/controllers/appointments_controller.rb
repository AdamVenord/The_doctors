class AppointmentsController < ApplicationController
  before_action :set_office

  def index
    @doctors = @office.appointments.where(role: 'doctor')
    @nurses = @office.appointments.where(role: 'nurse')
    @patients = @office.appointments.where(role: 'patient')
  end

  def new
    @users = User.all - @office.users
    @appointment = @office.appointments.new
  end

  def create
    @appointment = @office.appointments.new(appointment_params)
    if @appointment.save
      redirect_to office_appointments_path(@office)
    else
      render :new
    end
  end

  def destroy
    @appointment = @office.appointments.find(params[:id])
    @appointment.destroy
    redirect_to office_appointments_path(@office)
  end

 private
   def set_office
     @office = Office.find(params[:office_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:role, :user_id)
   end
end
