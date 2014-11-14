class AuthorizationService

	def initialize(params)
		@email = params[:email]
		@password = params[:password]
	end


	def load_current_user
		@current_user.id
	end



	def authorize
		encrypted_password = encrypt_password params[@email], params[@password]

		if user = User.find_by_email(@email)
			if encrypted_password == user.password_encrypted
				puts "Logged as #{user.name}"
				@current_user = user
				return user.id
			end
		end

		return nil
	end


	def edit_password old_password new_password

		encrypted_password = encrypt_password @current_user.email, old_password

		if encrypted_password == @current_user.password_encrypted
			@current_user.password = new_password
			if @current_user.save
				return true
			end
		end

		false

	end


	def self.encrypt_password email, password
		#Encrypt the passed password and compare with the one in DB
		salt = Digest::SHA1.hexdigest("#{email}#{password}")
		encrypted_password = Digest::SHA1.hexdigest("#{salt}#{password}")
	end


end