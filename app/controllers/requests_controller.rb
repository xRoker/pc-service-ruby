class RequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  before_action :let_signed_only


  def manage
    @requests = Request.includes(:service).all
    @accepted_requests = Request.accepted.where(services: {user_id: @user.id})
  end

  def monitor
    @requests = @user.requests
  end

	def new
    @addresses = Address.where(user_id: @user.id)
  end

  def create

    # Check if a value of the dropdown menu is not "Nowy..."
    if params[:address_select] == "Nowy..."

      address = Address.new address_params
      address.user_id = @user.id
      address.save
      address_id = address.id

    else address_id = params[:address_select]

    end

      request = Request.new request_params
      request.user_id = @user.id
      request.address_id = address_id
      request.warranty ||= false

      if request.save
        flash[:success] = true
      else flash[:fail] = true
      end
      redirect_to new_request_path
  end

  def accept
    service = Request.find(params[:id]).create_service
    service.user = @user
    service.save
    redirect_to manage_requests_path
  end

  def decline
    Request.find(params[:id]).service.destroy
    redirect_to manage_requests_path
  end

  private


    def address_params
      params.require(:address).permit(:name, :surname, :phone, :company, :zip, :city, :aprtment)
    end

    def request_params
      params.require(:request).permit(:device_type, :model, :description, :priority, :warranty)
    end

    def let_signed_only
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        redirect_to login_users_path 
      end
    end
	
end
