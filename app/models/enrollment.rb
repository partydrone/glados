class Enrollment < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[\w\-.]+\.[a-z]+\z/i }
end
