require 'test_helper'

describe WebsiteTermsOfUseDocumentsController, :locale do
  it "gets index" do
    get website_terms_of_use_documents_path
    must_respond_with :success
  end

  it "gets show" do
    get website_terms_of_use_document_path(website_terms_of_use_documents(:current_website_terms_of_use_document))
    must_respond_with :success
  end
end
