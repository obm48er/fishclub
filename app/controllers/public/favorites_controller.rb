class Public::FavoritesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @favorite = current_user.favorites.new(post_id: @post.id)
      @favorite.save
      if params[:type] == "index"
        redirect_to public_posts_path
      elsif params[:type] == "like"
        redirect_to request.referer
      else
        redirect_to public_post_path(@post)
      end
    end

  def destroy
      @post = Post.find(params[:post_id])
      favorite = current_user.favorites.find_by(post_id: @post.id)
      favorite.destroy
      if params[:type] == "index"
          redirect_to public_posts_path
      elsif params[:type] == "like"
          redirect_to request.referer
      else
          redirect_to public_post_path(@post)
      end
  end
end
