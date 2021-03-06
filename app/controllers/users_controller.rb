class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account Created"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order("created_at").last(10).reverse
    @comments = @user.comments.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    updates = {}
    user_params.each do |col,val|
      if !val.blank?
        updates[col.to_sym] = val 
      end
    end
    @user.update_attributes(updates)
    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :last_name, :profile_picture, :background_picture, :bio)
  end
end