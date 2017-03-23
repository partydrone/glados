class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable :against => [:name, :region, :country_id]
end
