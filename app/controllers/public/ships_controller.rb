class Public::ShipsController < ApplicationController
  def index
  @ships = Ship.all
  @ship = Ship.page(params[:page]) 
  end

  def show
    @ship = Ship.find(params[:id])
    @review = Review.new
    @ship_reviews = @ship.reviews
  end

  private


end
