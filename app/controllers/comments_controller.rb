class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    puts "-----PARAMS--------"
    p params
    @comment = current_user.comments.create(comment_params)
    redirect_to @post
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @post
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
