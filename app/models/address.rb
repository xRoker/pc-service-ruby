class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  validates_presence_of :name, :surname, :phone, :user_id
end
