class Territory < ApplicationRecord
	include PgSearch
  
  multisearchable against: [:name],
  				  if: :dealer?

	validates :name, :office, :dealer, presence: true
end
