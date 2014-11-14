class UsersController < ApplicationController


    skip_before_filter :verify_authenticity_token  

    before_action :load_current_user, only: [:manage, :edit_password, :admin_required]
    before_action :admin_required, only: [:manage]


	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def login
	end

	def edit_password_form
	end

	def manage
	end


	#Loading info using strong parameters
	def user_params
		params.permit(:email, :password, :name, :surname, :phone, :company, :zip, :city, :street, :appartment)
    end



	#If everything is good create user. Otherwise show the flash
	def create_user
		user = User.new user_params
		
		# set this field as 0 because it can't be null
		user.password_encrypted = 0
		if user.save
			@auth = AuthorizationService.new(user.email, params[:password])
			session[:user_id] = @auth.authorize
			redirect_to @auth.load_current_user
		else 
			puts "ERROR >>>>>>>>>>>>>>>>>> #{u.errors.full_messages}"
			flash[:notice] = user.errors.full_messages
			redirect_to new_user_path
		end

	end


	def authorize
		@auth = AuthorizationService.new(params[:email], params[:password])
		session[:user_id] = @auth.authorize
		if session[:user_id]
			redirect_to @auth.load_current_user
		else 
			flash[:notice] = "wrong"
			redirect_to authorize_path
		end

	end

	def edit_password

		if @auth.edit_password params[:password], params[:new_password]

			flash[:notice] = "success"
		else
			flash[:notice] = "wrong"
		end
		redirect_to edit_password_form_path
	end


	def logout
		session[:user_id] = nil
		redirect_to login_path
	end


end
