class SessionsController < ApplicationController
  # layout "sessions_layout"
   def new
  end
  
  def create
  	@user = User.check_login(params[:email], params[:password])
  	if @user
  		session[:user_id] = @user.id
      if params[:redirect_url] != "" || nil
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

