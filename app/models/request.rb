class Request < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user_id, :address_id,
   :device_type, :model, :description, :priority
  validates :warranty, inclusion: [true, false]
end
