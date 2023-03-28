class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @comment =PostComment.find(params[:id])
    @comment.update(post_comment_params)
      redirect_to admin_homes_path
  end
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment,:status)
  end
end
