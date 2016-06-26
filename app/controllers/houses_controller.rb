class HousesController < ApplicationController
  def index

  end

  def create
    @house = House.new(user_params)
    @house.save
    redirect_to houses_url
  end

  def show
    @house = House.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:house).permit(:name)
  end
end
