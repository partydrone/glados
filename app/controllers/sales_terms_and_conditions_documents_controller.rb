class SalesTermsAndConditionsDocumentsController < ApplicationController
  def index
    @sales_terms_and_conditions_documents = SalesTermsAndConditionsDocument.order(modified_at: :desc)
  end

  def show
    @legal_policy_document = SalesTermsAndConditionsDocument.find(params[:id])
    render 'legal_policy_documents/show'
  end
end
