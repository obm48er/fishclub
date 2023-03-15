class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to public_post_path(@post)
  end
  def update
    @comment =PostComment.find(params[:id])
    @comment.update(post_comment_params)
      redirect_to admin_homes_path
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment,:status)
  end
end