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
    @ship = Ship.find(params[:id])
  end
  
  def edit
      @ship =Ship.find(params[:id])
      @city =City.all
  end
  def update
      @ship = Ship.find(params[:id])
      if params[:ship][:image_ids]
      params[:ship][:image_ids].each do |image_id|
        image = @ship.images.find(image_id)
        image.purge
       end
      end
    if@ship.update(ship_params)
      redirect_to admin_ship_path(@ship.id)
    else
      render :edit
    end
  end  
  
  def destroy
    @ship = Ship.find(params[:id])
    @ship.destroy
    redirect_to admin_ships_path
  end

  def ship_params
    params.require(:ship).permit(:name, :body, :phone_number, :city_id,images: [])
  end

end
