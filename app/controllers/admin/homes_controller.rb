class Admin::HomesController < ApplicationController
  #before_action :authenticate_admin!
  def index
    @user = User.order(created_at: :desc).limit(5)
    @ship = Ship.order(created_at: :desc).limit(5)
    @post = Post.order(created_at: :desc).limit(5)
    @review = Review.order(created_at: :desc).limit(5)
    @comment = PostComment.order(created_at: :desc).limit(5)
  end
end
