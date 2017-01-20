class SalesTermsAndConditionsDocumentsController < ApplicationController
  before_action :set_sales_terms_and_conditions_document, only: [:show, :edit, :update, :destroy]

  def index
    @sales_terms_and_conditions_documents = SalesTermsAndConditionsDocument.all
  end

  def show
  end

  

  private

  def set_sales_terms_and_conditions_document
    @sales_terms_and_conditions_document = SalesTermsAndConditionsDocument.find(params[:id])
  end

  def sales_terms_and_conditions_document_params
    params.require(:sales_terms_and_conditions_document).permit(:title, :body, :effective_on, :attachment)
  end
end
