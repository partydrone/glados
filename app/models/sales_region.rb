class SalesRegion < ApplicationRecord
  has_many :sales_territories
  has_many :sales_offices, through: :sales_territories

  validates :name, presence: true
end
