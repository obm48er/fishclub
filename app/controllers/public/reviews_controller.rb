class Public::ReviewsController < ApplicationController
   
   
    def create
    @ship = Ship.find(params[:ship_id])
    @review = Review.new(review_params)
    @review.user_id = 1
    @review.ship_id = @ship.id
    @review.save!
    redirect_to public_ship_path(@ship)
    end

  private

  def review_params
    params.require(:review).permit(:user_id,:ship_id,:title,:body,:star)
  end

end
