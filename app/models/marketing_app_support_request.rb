class MarketingAppSupportRequest
  include ActiveModel::Model
  attr_accessor :name, :email, :description

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[\w\-.]+\.[a-z]+\z/i }
  validates :description, presence: true
end
