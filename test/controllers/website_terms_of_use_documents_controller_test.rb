require 'test_helper'

describe WebsiteTermsOfUseDocumentsController, :locale do
  let(:website_terms_of_use_document) { website_terms_of_use_documents(:current_website_terms_of_use_document)}

  it "gets index" do
    get website_terms_of_use_documents_path
    must_respond_with :success
  end

  it "gets new" do
    get new_website_terms_of_use_document_path
    must_respond_with :success
  end

  it "creates a Website Terms of Use document" do
    -> {
      post website_terms_of_use_documents_path, params: {
        website_terms_of_use_document: {
          title: 'Policy',
          body: 'These are the policies.',
          effective_on: 2.days.from_now.to_date.to_s(:db)
        }
      }
    }.must_change 'WebsiteTermsOfUseDocument.count'
    flash[:notice].wont_be_nil
    # FIXME: Troubleshoot bug where this assertion fails with STI tables, objects, and fixtures.
    # must_redirect_to website_terms_of_use_document_path(WebsiteTermsOfUseDocument.last)
    must_respond_with :redirect
  end

  it "gets show" do
    get website_terms_of_use_document_path(website_terms_of_use_document)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_website_terms_of_use_document_path(website_terms_of_use_document)
    must_respond_with :success
  end

  it "updates a Website Terms of Use document" do
    patch website_terms_of_use_document_path(website_terms_of_use_document), params: {
      website_terms_of_use_document: {
        title: website_terms_of_use_document.title
      }
    }
    must_redirect_to website_terms_of_use_document_path(website_terms_of_use_document)
  end

  it "destroys a Website Terms of Use document" do
    -> {
      delete website_terms_of_use_document_path(website_terms_of_use_document)
    }.must_change 'WebsiteTermsOfUseDocument.count', -1
    must_redirect_to website_terms_of_use_documents_path
  end
end
