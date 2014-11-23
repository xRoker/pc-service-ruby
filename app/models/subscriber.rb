class Subscriber < ActiveRecord::Base
  #Validate presence and uniqueness of email
  validates :email, presence: true, uniqueness: true

  def self.subscribe email
    subscriber = Subscriber.new
    subscriber.email = email
    subscriber.save
  end

  def self.unsubscribe email
    Subscriber.find_by_email(email).destroy
  end

  def self.subscribed? email
    Subscriber.find_by_email(email)
  end

end
