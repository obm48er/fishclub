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
       flash[:success] = "アップデートに成功しました。"
       redirect_to admin_cities_path
    else
       flash.now[:danger] = "アップデートに失敗しました。"
       render :new
    end
  end
  
  def city_params
    params.require(:city).permit(:name, :prefecture_code)
  end
end
