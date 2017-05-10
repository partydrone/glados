class Territory < ApplicationRecord
	include PgSearch
  
  multisearchable against: [:name]

	validates :name, :office, :dealer, presence: true
end
