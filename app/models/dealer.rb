class Dealer < ApplicationRecord
	def self.search(name)
	  if name
	  	Dealer.where('name LIKE :search OR country LIKE :search OR region LIKE :search', search: "%#{search}%")
	  else
	    all
	  end
	end
end
