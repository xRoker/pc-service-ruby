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
    @request = Request.new
    @addresses = []
    Address.where(user_id: @user.id).each do |address|
      @addresses << [address.to_str, address.id]
    end
    @addresses << ["Nowy...", -1]

    @name = @user.name
    @surname = @user.surname
  end

  def create
    request = RequestForm.new(Request.new)
<<<<<<< HEAD
    if request.apply @user.id, request_params, address_params
=======
    if request.apply @user.id, request_params
>>>>>>> FETCH_HEAD
      flash[:success] = true
    else flash[:fail] = true
    end
    redirect_to new_request_path
  end

  def accept
    service = Request.find(params[:id]).create_service
    service.user = @user
    service.save
    NewsMailer.acceptation(service.request.user.email)
    redirect_to manage_requests_path
  end

  def decline
    Request.find(params[:id]).service.destroy
    redirect_to manage_requests_path
  end

  private


    # def address_params
    #   params.require(:address).permit(:name, :surname, :phone, :company, :zip, :city, :aprtment)
    # end

    def request_params
      params.require(:request).permit(:device_type, :model_name, :description, :priority, :warranty,
<<<<<<< HEAD
       :address_id)
=======
       :address_id, address: [:name, :surname, :phone, :company, :zip, :city, :street, :apartment])
>>>>>>> FETCH_HEAD
    end

    def let_signed_only
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        redirect_to login_users_path 
      end
    end
	
end
