class Public::PostsController < ApplicationController
  def index
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def create
     @post = Post.new(post_params)
     @post.user_id = current_user.id
    if @post.save
       flash[:notice] = "successfully"
       redirect_to public_posts_path(@post.id)
    else
       redirect_to admin_ships_path
    end
  end


  def show
     @post = Post.find(params[:id])
  end

  def edit
    @post =Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = @post.images.find(image_id)
        image.purge
       end
      end
    if@post.update(post_params)
      redirect_to public_post_path(@post.id)
    else
      render :edit
    end
  end
   def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_post_path
   end
   def post_params
    params.require(:post).permit(:user_id,:title, :body,images: [])
   end

end
