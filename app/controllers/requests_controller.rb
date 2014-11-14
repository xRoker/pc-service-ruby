class RequestsController < ApplicationController

	def new
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to login_path 
    end
  end
	
end
