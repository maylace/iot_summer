class DevicesController < ApplicationController

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
    @house = House.find(params[:house_id])


  end

  def create
    @house = House.find(params[:house_id])
    @device = Device.new(user_params)
<<<<<<< HEAD
    @device.house_id = @house.id
=======
    @device.save

>>>>>>> requests
    @device.save
    redirect_to house_path(@house.id)
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
    redirect_to houses_path
  end

  def user_update
    @device = Device.find(params[:id])
    @log = JsonLogDevice.find_by(device_id: @device.id)
    @device.update(user_params)
  end

  private

  def user_params
    params.require(:device).permit!
  end
end
