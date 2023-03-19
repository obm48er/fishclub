class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.all
    @ship = Ship.all
    @post = Post.all
    @review = Review.all
    @comment = PostComment.all
  end
end
