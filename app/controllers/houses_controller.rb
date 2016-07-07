class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def edit
    @house = House.find(params[:id])
  end

  def create

    @house = House.new(user_params)
    @house.user = current_user
    @house.save
    redirect_to houses_path
  end

  def show
    @house = House.find(params[:id])
  end

def update
  @house = House.find(params[:id])
  if @house.update(user_params)
    redirect_to houses_path
  end
end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path
  end

  def create_device
    @house = House.find_by(user_params)
    @device = Device.new(user_params)
    @device.house_id = @house.id
    @device.save
  end

  private
  def user_params
    params.require(:house).permit!
    params.require(:device).permit!
  end
end
