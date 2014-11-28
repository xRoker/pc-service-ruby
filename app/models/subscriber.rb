class Subscriber < ActiveRecord::Base
  has_one :user

  #Validate presence and uniqueness of email
  validates :user_id, presence: true, uniqueness: true

  def self.subscribe user_id
    subscriber = Subscriber.new
    subscriber.user_id = user_id
    subscriber.save
  end

  def self.unsubscribe user_id
    Subscriber.find_by_user_id(user_id).destroy
  end

  def self.subscribed? user_id
    Subscriber.find_by_user_id(user_id)
  end

end
