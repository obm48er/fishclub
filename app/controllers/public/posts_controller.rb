class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit,:updaete,:destroy]
  
  
  def index
    @post = Post.published.page(params[:page])

  end
  def search
    @results = @q.result
  end

  def new
    @post = Post.new
  end
  def create
     @post = Post.new(post_params)
     @post.user_id = current_user.id
    if @post.save
       @post.save_tag(params[:post][:tag].split(","))
       flash[:success] = "投稿に成功しました。"
       redirect_to public_posts_path(@post)
    else
       flash.now[:danger] = "投稿に失敗しました。"
       render :new
    end
  end


  def show
     @post = Post.find(params[:id])
     if @post.is_deleted == true && @post.user != current_user
       redirect_to public_posts_path
     else
     @post_comment = PostComment.new
     end
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
      @post.save_tag(params[:post][:tag].split(","))
      flash[:success] = "投稿に成功しました。"
      redirect_to public_post_path(@post.id)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit
    end
  end
   def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
   end

   private
   
     def is_matching_login_user
         pos = Post.find(params[:id])
         unless pos.user.id == current_user.id
             redirect_to public_posts_path
         end
     end

   def post_params
    params.require(:post).permit(:status,:user_id,:title, :is_deleted, :body,:tag_list,images: [])
   end

end
