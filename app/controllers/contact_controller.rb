class ContactController < ApplicationController
	def index
		@search_results = PgSearch.multisearch(params[:query])
																	 .where(searchable_type: ['Dealer', 'SalesTerritory'])
																	 .map(&:searchable)

		@sales_regions = SalesRegion.includes(:sales_offices)
																.order('sales_regions.position, sales_offices.name')
																.references(:sales_offices)
	end
end
