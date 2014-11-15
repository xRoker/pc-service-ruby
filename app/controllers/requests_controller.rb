class RequestsController < ApplicationController

	def new
    let_signed_only
    @addresses = Address.where(user_id: @user.id)
  end

  def create
  end


  def manage
    
  end


  #Loading info using strong parameters
  def request_params
    params.permit(:name, :surname, :phone, :company, :zip, :city, :street, :apartment)
  end



  def let_signed_only
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to login_path 
    end
  end
	
end
