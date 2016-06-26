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
    @house = House.find(params[:id])
    if @house.update(user_params)
      redirect_to @house
    end
  end

  def destroy
    @house = House.find(params[:id])
    if @house.destroy
      redirect_to houses_path
    end
  end

  private
  def user_params
    params.require(:house).permit(:name)
  end
end
