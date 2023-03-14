class Public::ShipsController < ApplicationController
  def index
    @ship = Ship.all
  end

  def show
    @ship = Ship.find(params[:id])
    @review = Review.new
    @ships = @ship.reviews.all
    
  end
end
             