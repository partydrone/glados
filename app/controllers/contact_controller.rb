class ContactController < ApplicationController
	def index
		@dealers = Dealer.text_search(params[:query])
		@territories = Territory.all
	end


end
