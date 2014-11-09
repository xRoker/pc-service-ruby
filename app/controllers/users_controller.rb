class UsersController < ApplicationController


    skip_before_filter :verify_authenticity_token  


	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def create_user
		u = User.new
		u.email = params[:email]
		u.password = params[:password]
		u.admin = false
		u.name = params[:name]
		u.surname = params[:surname]
		u.phone = params[:phone]
		u.company = params[:company]
		u.zip = params[:zip]
		u.city = params[:city]
		u.street = params[:street]
		u.appartment = params[:appartment]
		if u.save
			redirect_to u
		else puts "ERROR >>>>>>>>>>>>>>>>>> #{u.errors.full_messages}"
			redirect_to new_user_path
		end

	end
end
