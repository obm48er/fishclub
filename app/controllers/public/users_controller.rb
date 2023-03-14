class Public::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.all
    @comments = @user.posts.comments.all
  end

  def edit
  end
end
