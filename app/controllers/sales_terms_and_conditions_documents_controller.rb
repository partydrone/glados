class SalesTermsAndConditionsDocumentsController < ApplicationController
  def show
    @sales_terms_and_conditions_document = SalesTermsAndConditionsDocument.find(params[:id])
  end
end
