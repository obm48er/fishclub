class Public::ShipsController < ApplicationController
  def index
  end

  def show
    @ship = Ship.find(params[:id])
    @review = Review.new
  end
end
