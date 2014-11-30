class Service < ActiveRecord::Base
  belongs_to :user # a worker
  belongs_to :request
end
