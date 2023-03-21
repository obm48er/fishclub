class Public::ShipsController < ApplicationController
  def index
    @ship = Ship.page(params[:page])
  end

  def show
    @ship = Ship.find(params[:id])
    @review = Review.new
    @ships = @ship.reviews
  end
  
  private
  

end
             