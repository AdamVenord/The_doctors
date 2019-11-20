class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :destroy]

  def index
    @offices = Office.all
  end

  def show
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to @office
    else
      render :new
    end
  end

  def destroy
    @office.destroy
    redirect_to offices_path
  end

  private
    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:name)
    end
end