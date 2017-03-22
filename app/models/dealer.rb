class Dealer < ApplicationRecord
	def self.text_search(query)
	  if query.present?
	  	Dealer.where('name @@ :q OR country_id @@ :q OR region @@ :q', q: query)
	  else
	    all
	  end
	end
end
