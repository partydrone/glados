class WebsiteTermsOfUseDocumentsController < ApplicationController
  before_action :set_website_terms_of_use_document, only: [:show, :edit, :update, :destroy]

  def index
    @website_terms_of_use_documents = WebsiteTermsOfUseDocument.all
  end

  def show
  end
  
  private

  def set_website_terms_of_use_document
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.find(params[:id])
  end

  def website_terms_of_use_document_params
    params.require(:website_terms_of_use_document).permit(:title, :body, :effective_on)
  end
end
