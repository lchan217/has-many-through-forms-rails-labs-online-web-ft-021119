require 'pry'
class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.create(comment_params)
    @comment.save
    @post.save
    redirect_to post_path(@post)
  end
  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes: [:username], user_ids:[])
  end
end
