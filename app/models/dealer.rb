class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable against: [:name, :country_id],
  					using: COUNTRIES


	validates :name, :address, :locality, :region, :postal_code, :phone, :email, :website, presence: true

end



