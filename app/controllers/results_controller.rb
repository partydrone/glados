class ResultsController < ApplicationController
  def index
  	@pg_search_site = PgSearch.multisearch(params[:sitequery])
  end
end
