class ContactController < ApplicationController
	def index
		@q = Dealer.ransack(params[:q])
		@dealers = @q.result(distinct: true)
		@territories = Territory.all
	end


end
