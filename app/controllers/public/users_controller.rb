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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:user_id,:Introduction,:name, :image)
  end



end
