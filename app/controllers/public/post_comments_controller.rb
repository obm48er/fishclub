class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit,:updaete,:destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if@comment.save
      flash[:success] = "投稿に成功しました。"
      redirect_to public_post_path(@post)
    else
     flash[:danger] = "投稿に失敗しました。"
     redirect_to public_post_path(@post)
    end
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
   def is_matching_login_user
         pos = PostComment.find(params[:id])
         unless pos.user.id == current_user.id
             redirect_to public_post_path(pos.post_id)
         end
   end

  def post_comment_params
    params.require(:post_comment).permit(:comment,:status)
  end
end