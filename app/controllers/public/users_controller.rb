class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  before_action :authenticate_user!, except: [:show]
  before_action :is_matching_login_user, only: [:edit, :update]

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
    if@user.update(user_params)
      flash[:success] = "投稿に成功しました。"
      redirect_to public_user_path(@user)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit
    end
  end
  def likes
    likes = Favorite.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.published.where(id: likes).order(created_at: :desc)
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:user_id,:Introduction,:name, :image)
  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to public_user_path(user)
    end
  end


end
