class WebsiteTermsOfUseDocumentsController < ApplicationController
  before_action :set_website_terms_of_use_document, only: [:show, :edit, :update, :destroy]

  def index
    @website_terms_of_use_documents = WebsiteTermsOfUseDocument.all
  end

  def show
  end

  def new
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.new
  end

  def edit
  end

  def create
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.new(website_terms_of_use_document_params)

    if @website_terms_of_use_document.save
      redirect_to @website_terms_of_use_document, notice: %(Saved "#{@website_terms_of_use_document.title}" successfully.)
    else
      render :new
    end
  end

  def update
    if @website_terms_of_use_document.update(website_terms_of_use_document_params)
      redirect_to @website_terms_of_use_document, notice: %(Updated "#{@website_terms_of_use_document.title}" successfully.)
    end
  end

  def destroy
    @website_terms_of_use_document.destroy
    redirect_to website_terms_of_use_documents_path, notice: %(Deleted "#{@website_terms_of_use_document.title}" successfully.)
  end

  private

  def set_website_terms_of_use_document
    @website_terms_of_use_document = WebsiteTermsOfUseDocument.find(params[:id])
  end

  def website_terms_of_use_document_params
    params.require(:website_terms_of_use_document).permit(:title, :body, :effective_on)
  end
end
