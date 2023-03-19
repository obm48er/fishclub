class Admin::CitiesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @city = City.new
  end
  def index
      @city = City.all
  end
  def create
   @city = City.new(city_params)
    if @city.save
       flash[:notice] = "successfully"
       redirect_to admin_cities_path
    else
       redirect_to admin_cities_path
    end
  end
  
  def city_params
    params.require(:city).permit(:name, :prefecture_code)
  end
end
