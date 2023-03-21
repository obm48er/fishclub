class Admin::UsersController < ApplicationController
  #before_action :authenticate_admin!
  def index
    @user = User.all
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
  params.require(:user).permit(:is_deleted)
  end
  
end
