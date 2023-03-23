class Public::ReviewsController < ApplicationController


    def create
          @ship = Ship.find(params[:ship_id])
          @review = Review.new(review_params)
          @review.user_id = current_user.id
          @review.ship_id = @ship.id
          if @review.save
            
             redirect_to public_ship_path(@ship)
          else
             
             redirect_to public_ship_path(@ship)
          end
    end
    
     def destroy
          @review = Review.find(params[:id])
          if@review.destroy
            redirect_to public_ship_path(params[:ship_id])
          else
          end
     end
   
        

  private

  def review_params
    params.require(:review).permit(:user_id,:ship_id,:title,:body,:start, :all_rating, :rating1, :rating2, :rating3, :rating4)
  end

end
