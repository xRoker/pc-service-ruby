class UsersController < ApplicationController


  skip_before_filter :verify_authenticity_token

  before_action :load_current_user, only: [:manage, :edit_password, :admin_required]
  before_action :admin_required, only: [:manage]


	def new
	end

	def show
		@user = User.find(params[:id])
		@subscribed = Subscriber.subscribed? @user.email
	end


	def edit_password_form
	end

	def manage
		#Load table names to show
		@columns = []
		column_filter = ["password", "created_at", "password_encrypted"]
		User.column_names.each do |column|
			@columns << column unless column_filter.include? column
		end

		@users = User.all
	end



	def login
	end

	def logout
		session[:user_id] = nil
		redirect_to login_path
	end


	def load_current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end


	#Loading info using strong parameters
	def user_params
		params.require(:user).permit(:email, :password, :name, :surname)
  end



	#If everything is good create user. Otherwise show the flash
	def create_user
		user = User.new user_params
		
		# set this field as 0 because it can't be null
		user.password_encrypted = 0
		if user.save
			session[:user_id] = user.id

			if params[:notify]
				NewsMailer.registration(user).deliver
			end

			redirect_to user
		else 
			puts "ERROR >>>>>>>>>>>>>>>>>> #{u.errors.full_messages}"
			flash[:notice] = user.errors.full_messages
			redirect_to new_user_path
		end

	end



	def authorize
		encrypted_password = encrypt_password params[:email], params[:password]

		if user = User.find_by_email(params[:email])
			if encrypted_password == user.password_encrypted
				puts "Logged as #{user.name}"
				session[:user_id] = user.id
				redirect_to user
			else
				flash[:notice] = "Wrong password"
				redirect_to login_path
			end
		else 
			flash[:notice] = "Can't find #{params[:email]}"
			redirect_to login_path
		end
	end


	def edit_password

		encrypted_password = encrypt_password @current_user.email, params[:password]

		if encrypted_password == @current_user.password_encrypted
			@current_user.password = params[:new_password]
			if @current_user.save
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
			redirect_to root_path unless @current_user && @current_user.admin
		end


end
