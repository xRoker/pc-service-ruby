class User < ActiveRecord::Base
	#DB relation
	has_many :requests

	#Validate presence and uniqueness of some paraters
	validates :email, presence: true, uniqueness: true
	validates_presence_of  :password, :name, :surname

	#Encrypt password before saving
	before_save :encrypt_password
	def encrypt_password
		if password.present?
			#Adding salt based on email and password
			salt = Digest::SHA1.hexdigest("#{email}#{password}")
			self.password = Digest::SHA1.hexdigest("#{salt}#{password}")

		end
	end

end
