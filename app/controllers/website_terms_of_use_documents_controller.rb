class WebsiteTermsOfUseDocumentsController < ApplicationController
  def index
    @website_terms_of_use_documents = WebsiteTermsOfUseDocument.order(modified_at: :desc)
  end

  def show
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.find(params[:id])
  end
end
