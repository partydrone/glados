class SalesTerritory < ApplicationRecord
	include PgSearch
  multisearchable against: [:name]

	belongs_to :dealer
	belongs_to :sales_office
	belongs_to :sales_region

	validates :name, :sales_office_id, :sales_region_id, presence: true
end
