class Admin::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
      if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
       end
      end
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
    params.require(:post).permit(:status,:user_id,:title, :body,images: [])
   end
  
end
