class Admin::PostsController < ApplicationController
  # :authenticate_admin!
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_homes_path
    
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
  
  private
  
   def post_params
    params.require(:post).permit(:status,:user_id,:title, :body)
   end
  
end
