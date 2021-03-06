class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    puts "-----PARAMS--------"
    p params
    @comment = current_user.comments.create(comment_params)
    redirect_to @comment.post
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @comment.post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    current_user.comments.find(params[:id]).destroy
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end