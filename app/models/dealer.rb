class Dealer < ApplicationRecord
	def self.search(name)
	  if name
	  	Dealer.where('name @@ :search OR country @@ :search OR region @@ :search', search: search)
	  else
	    all
	  end
	end
end
