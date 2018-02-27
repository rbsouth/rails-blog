class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to login_path
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order("created_at").last(10).reverse
    @comments = @user.comments.all
    p params
    #@posts = @user.posts.order("created_at").last(10).reverse
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :last_name, :profile_picture, :background_picture, :bio)
  end
end