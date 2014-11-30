class Request < ActiveRecord::Base
	belongs_to :user
  has_one :service
  belongs_to :address
	validates_presence_of :user_id, :address_id,
   :device_type, :model, :description, :priority
  validates :warranty, inclusion: [true, false]

  # Get all unprocessed requests
  scope :pending, -> { includes(:service).where(services: { request_id: nil }) }
  # Get all accepted requests
  scope :accepted, -> { includes(:service).where.not(services: { request_id: nil }) }
end
