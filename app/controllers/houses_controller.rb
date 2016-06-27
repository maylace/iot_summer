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
    @house.user = curent_user
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

  private
  def user_params
    params.require(:house).permit!
  end
end
