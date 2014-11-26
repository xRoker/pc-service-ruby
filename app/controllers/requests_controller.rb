class RequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_action :let_signed_only 

	def new
    @addresses = Address.where(user_id: @user.id)
  end

  def create

    permitted_params = params.permit(:name, :surname, :phone, :company, 
      :zip, :city, :street, :apartment, :device_type, :model, :description,
      :warranty, :priority, :address_select)

    # Check if a value of the dropdown menu is not "Nowy..."
    if permitted_params[:address_select] == "Nowy..."

      address = Address.new
      address.user_id = @user.id

      address.name = permitted_params[:name]
      address.surname = permitted_params[:surnname]
      address.phone = permitted_params[:phone]
      address.company = permitted_params[:company]
      address.zip = permitted_params[:zip]
      address.city = permitted_params[:city]
      address.apartment = permitted_params[:apartment]

      address.save

      address_id = address.id

    else address_id = permitted_params[:address_select]

    end

      request = Request.new
      request.user_id = @user.id
      request.address_id = address_id

      request.device_type = permitted_params[:device_type]
      request.model = permitted_params[:model]
      request.description = permitted_params[:description]
      request.priority = permitted_params[:priority]
      request.warranty = permitted_params[:warranty] ? permitted_params[:warranty] : false

      if request.save
        flash[:success] = true
      else flash[:fail] = true
      end
      redirect_to new_request_path
  end


  def manage
    
  end



  def let_signed_only
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to login_path 
    end
  end
	
end
