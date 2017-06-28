class DemoRequest
  include ActiveModel::Model
  attr_accessor :name, :company, :email, :region, :country

  validates :name, :company, presence: true
  validates :email, presence: true, email: true
end
