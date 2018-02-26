class PostsController < ApplicationController
   def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    puts "-----PARAMS--------"
    p params
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :picture, :content)
  end
end

