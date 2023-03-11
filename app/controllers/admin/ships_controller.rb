class Admin::ShipsController < ApplicationController
  
  def index
    @ship = Ship.all
  end
  def new
    @ship = Ship.new
    @city = City.all
  end
  def create
    @ship = Ship.new(ship_params)
    if @ship.save
       flash[:notice] = "successfully"
       redirect_to admin_ships_path(@ship.id)
    else
       redirect_to admin_ships_path
    end
  end
  
  def show
  end
  
  def ship_params
    params.require(:ship).permit(:name, :body, :phone_number,:city_id)
  end

end
