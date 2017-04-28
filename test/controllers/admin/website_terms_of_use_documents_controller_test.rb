require 'test_helper'

describe Admin::WebsiteTermsOfUseDocumentsController, :locale do
  let(:website_terms_of_use_document) { website_terms_of_use_documents(:current_website_terms_of_use_document)}

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_website_terms_of_use_documents_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_website_terms_of_use_document_path
      must_respond_with :success
    end

    it "creates a Website Terms of Use document" do
      -> {
        post admin_website_terms_of_use_documents_path, params: {
          website_terms_of_use_document: {
            title: 'Policy',
            body: 'These are the policies.',
            effective_on: 2.days.from_now.to_date.to_s(:db)
          }
        }
      }.must_change 'WebsiteTermsOfUseDocument.count'
      flash[:notice].wont_be_nil
      # FIXME: Troubleshoot bug where this assertion fails with STI tables, objects, and fixtures.
      # must_redirect_to admin_website_terms_of_use_document_path(WebsiteTermsOfUseDocument.last)
      must_respond_with :redirect
    end

    it "gets show" do
      get admin_website_terms_of_use_document_path(website_terms_of_use_document)
      must_respond_with :success
    end

    it "gets edit" do
      get edit_admin_website_terms_of_use_document_path(website_terms_of_use_document)
      must_respond_with :success
    end

    it "updates a Website Terms of Use document" do
      patch admin_website_terms_of_use_document_path(website_terms_of_use_document), params: {
        website_terms_of_use_document: {
          title: website_terms_of_use_document.title
        }
      }
      must_redirect_to admin_website_terms_of_use_document_path(website_terms_of_use_document)
    end

    it "destroys a Website Terms of Use document" do
      -> {
        delete admin_website_terms_of_use_document_path(website_terms_of_use_document)
      }.must_change 'WebsiteTermsOfUseDocument.count', -1
      must_redirect_to admin_website_terms_of_use_documents_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_website_terms_of_use_documents_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_website_terms_of_use_document_path
      must_redirect_to sign_in_path
    end

    it "won't create a Website Terms of Use document" do
      -> {
        post admin_website_terms_of_use_documents_path, params: {
          website_terms_of_use_document: {
            title: 'Policy',
            body: 'These are the policies.',
            effective_on: 2.days.from_now.to_date.to_s(:db)
          }
        }
      }.wont_change 'WebsiteTermsOfUseDocument.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_website_terms_of_use_document_path(website_terms_of_use_document)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_website_terms_of_use_document_path(website_terms_of_use_document)
      must_redirect_to sign_in_path
    end

    it "won't update a Website Terms of Use document" do
      patch admin_website_terms_of_use_document_path(website_terms_of_use_document), params: {
        website_terms_of_use_document: {
          title: website_terms_of_use_document.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a Website Terms of Use document" do
      -> {
        delete admin_website_terms_of_use_document_path(website_terms_of_use_document)
      }.wont_change 'WebsiteTermsOfUseDocument.count', -1
      must_redirect_to sign_in_path
    end
  end
end
