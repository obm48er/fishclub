class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.order(created_at: :desc).page(params[:page]).per(10)
  end
  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      flash[:success] = "アップデートに成功しました。"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "アップデートに失敗しました。"
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
  params.require(:user).permit(:is_deleted)
  end

end
