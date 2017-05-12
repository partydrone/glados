class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable against: [:name, :country_id],
  					using: COUNTRIES

  	def self.search(search)


	validates :name, :address, :city, :region, :zip, :phone, :email, :website, presence: true

end

