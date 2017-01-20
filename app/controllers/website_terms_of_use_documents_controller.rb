class WebsiteTermsOfUseDocumentsController < ApplicationController
  def show
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.find(params[:id])
  end
end
