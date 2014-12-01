class Service < ActiveRecord::Base
  belongs_to :user # a worker
  belongs_to :request

  enum status: [:accepted, :analized, :done, :verified, :closed]

  before_save :default_values


  def default_values
    self.status ||= 1
  end

end
