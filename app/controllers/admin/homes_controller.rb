class Admin::HomesController < ApplicationController
  def index
    @user = User.all
    @ship = Ship.all
    @post = Post.all
    @review = Review.all
    @comment = PostComment.all
  end
end
