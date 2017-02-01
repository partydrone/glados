class TrainingEventRequest
  include ActiveModel::Model
  attr_accessor :company_name, :full_name, :email, :phone, :address, :city, :postal_code, :region, :country, :started_at, :ended_at, :capacity

  #validates :company_name, :full_name, :phone, :address, :city, :postal_code, :region, :country, :started_at, :ended_at, presence: true  
  #validates :email, presence: true, format: { with: /\A[\w+\-.]+@[\w\-.]+\.[a-z]+\z/i }
  #validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  

end