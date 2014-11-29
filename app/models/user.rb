class User < ActiveRecord::Base
	#DB relation
	has_many :requests
	has_one :subscriber, dependent: :destroy

	#Validate presence and uniqueness of some paraters
	validates :email, presence: true, uniqueness: true
	validates_presence_of :password_encrypted, :name, :surname

	#Encrypt password before saving
	before_save :encrypt_password

	enum gender: [:male, :female]

	def encrypt_password
		if password.present?
			#Adding salt based on email and password
			salt = Digest::SHA1.hexdigest("#{email}#{password}")
			self.password_encrypted = Digest::SHA1.hexdigest("#{salt}#{password}")
			self.password = nil

		end
	end

end
