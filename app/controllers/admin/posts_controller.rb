class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  def update
    @post = Post.find(params[:id])
    if@post.update(post_params)
      flash[:success] = "アップデートに成功しました。"
      redirect_to admin_homes_path
    else
      flash.now[:danger] = "アップデートに失敗しました。"
      @post = Post.find(params[:id])
      @user = @post.user
      render :show
    end
  end
  def destroy
    @post = Post.find(params[:id])
    if@post.destroy
    redirect_to admin_posts_path
    end
  end
  
  private
  
   def post_params
    params.require(:post).permit(:status,:user_id,:title, :body)
   end
  
end
