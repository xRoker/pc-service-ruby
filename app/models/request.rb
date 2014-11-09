class Request < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user_id, :time, :device_type, :model, :description, :warranty, :priority
end
