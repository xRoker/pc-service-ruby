class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  has_many :requests
  validates_presence_of :name, :surname, :phone, :user_id

  def to_str
    "#{name} #{surname}, #{company}, #{zip}, #{city}, #{street} #{apartment}, #{phone}"
  end

end
