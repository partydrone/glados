require 'test_helper'

describe SalesTermsAndConditionsDocumentsController, :locale do
  it "gets show" do
    get sales_terms_and_conditions_document_path(sales_terms_and_conditions_documents(:current_sales_terms_and_conditions_document))
    must_respond_with :success
  end
end
