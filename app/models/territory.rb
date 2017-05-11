class Territory < ApplicationRecord
	include PgSearch
  
  multisearchable against: [:name, :country], associated_against: {
  		COUNTRIES: :country
  	}

	validates :name, :office, :dealer, presence: true
end
