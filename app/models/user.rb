class User < ActiveRecord::Base
	has_many :requests
	validates :email, presence: true, uniqueness: true
	validates_presence_of  :password, :name, :surname
	validates_inclusion_of :admin, :in => [true, false]
end
