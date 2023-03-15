class Public::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.all
    @comment = PostComment.where(user_id: @user.id)
    @follow = @user.followings.pluck(:id)
    @posts = []
    @follow.each do |i|
      @posts << Post.find_by(user_id: i)
    end
    @posts
  end

  def edit
  end
end
