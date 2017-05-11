class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable :against => [:name, :region, :country_id], associated_against: {
  		COUNTRIES: [:country_id]
  	}

	validates :name, :address, :city, :region, :zip, :phone, :email, :website, presence: true

end
