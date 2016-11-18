class DemoRequest
  include ActiveModel::Model
  attr_accessor :name, :email, :country

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[\w\-.]+\.[a-z]+\z/i }
end
