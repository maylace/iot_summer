class DevicesController < ApplicationController
  def index
    @devices = Device.all
  e
  def new
    @device = Device.new
  end

  def create
    @device = Device.new(user_params)
    @device.house = @house.id
    @device.save
    redirect_to houses_path
  end

  def show
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(user_params)
      redirect_to house_path
    else
      render 'edit'
    end
  end

  def edit
    @device = House.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to house_path
  end

  private
  def user_params
    params.require(:device).permit!
  end
end
