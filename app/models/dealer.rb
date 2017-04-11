class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable :against => [:name, :region, :country_id], associated_against: {
  		COUNTRIES: :country_id
  	}
end
