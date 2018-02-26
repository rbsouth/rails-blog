class SessionsController < ApplicationController
  layout "sessions_layout"
   def new
  end
  
  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to login_path
  	else
      flash[:alert] = "Email or Password incorrect"
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end

