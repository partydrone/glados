class WebsiteTermsOfUseDocumentsController < ApplicationController
  def index
    @website_terms_of_use_documents = WebsiteTermsOfUseDocument.order(modified_at: :desc)
  end

  def show
    @legal_policy_document = WebsiteTermsOfUseDocument.find(params[:id])
    render 'legal_policy_documents/show'
  end
end
