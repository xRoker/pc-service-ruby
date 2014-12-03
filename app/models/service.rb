class Service < ActiveRecord::Base
  belongs_to :user # a worker
  belongs_to :request

  enum status: [:accepted, :analized, :done, :verified, :closed]

end
