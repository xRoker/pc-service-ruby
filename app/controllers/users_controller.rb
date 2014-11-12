class UsersController < ApplicationController


    skip_before_filter :verify_authenticity_token  

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






	#If everything is good create user. Otherwise show the flash
	def create_user
		u = User.new user_params
		
		# set this field as 0 because it can't be null
		u.password_encrypted = 0
		if u.save
			session[:user_id] = u.id
			redirect_to u
		else 
			puts "ERROR >>>>>>>>>>>>>>>>>> #{u.errors.full_messages}"
			flash[:notice] = u.errors.full_messages
			redirect_to new_user_path
		end

	end

	#Loading info using strong parameters
	def user_params
      params.permit(:email, :password, :name, :surname, :phone, :company, :zip, :city, :street, :appartment)
    end



	def authorize
		encrypted_password = encrypt_password params[:email], params[:password]

		if u = User.find_by_email(params[:email])
			if encrypted_password == u.password_encrypted
				puts "Logged as #{u.name}"
				session[:user_id] = u.id
				redirect_to u
			else
				flash[:notice] = "Wrong password"
				redirect_to login_path
			end
		else 
			flash[:notice] = "Can't find #{params[:email]}"
			redirect_to login_path
		end
	end



	def logout
		session[:user_id] = nil
		redirect_to login_path
	end


	def edit_password

		current_user = User.find(session[:user_id])

		encrypted_password = encrypt_password current_user.email, params[:password]

		if encrypted_password == current_user.password_encrypted
			current_user.password = params[:new_password]
			if current_user.save
				flash[:notice] = "success"
				redirect_to edit_password_form_path
			end
		else
			flash[:notice] = "wrong"
			redirect_to edit_password_form_path
		end
	end


	private

		def encrypt_password email, password
			#Encrypt the passed password and compare with the one in DB
			salt = Digest::SHA1.hexdigest("#{email}#{password}")
			encrypted_password = Digest::SHA1.hexdigest("#{salt}#{password}")
		end

		def admin_required
			if !User(session[:user_id]).admin
				redirect_to root_path
			end
		end


end
