class SalesTermsAndConditionsDocumentsController < ApplicationController
  def index
    @sales_terms_and_conditions_documents = SalesTermsAndConditionsDocument.order(modified_at: :desc)
  end

  def show
    @sales_terms_and_conditions_document = SalesTermsAndConditionsDocument.find(params[:id])
  end
end
