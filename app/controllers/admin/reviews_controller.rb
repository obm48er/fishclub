class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @review = Review.page(params[:page]).per(10)
  end
end
