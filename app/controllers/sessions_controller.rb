class SessionsController < ApplicationController
  # layout "sessions_layout"
   def new
  end
  
  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
      if params[:redirect_url]
        redirect_to params[:redirect_url]
      else
  		  redirect_to posts_path
      end
  	else
      flash[:alert] = "Email or Password incorrect"
  		redirect_to action: 'new', redirect_url: params[:redirect_url], email: params[:email]
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path
  end
end

