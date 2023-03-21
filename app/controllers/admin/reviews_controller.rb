class Admin::ReviewsController < ApplicationController
  #before_action :authenticate_admin!
  def index
    @review = Review.all
  end
end
