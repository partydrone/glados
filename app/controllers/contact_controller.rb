class ContactController < ApplicationController
	def index
		@pg_search_documents = PgSearch.multisearch(params[:query])
		@territories = Territory.all
	end
end
