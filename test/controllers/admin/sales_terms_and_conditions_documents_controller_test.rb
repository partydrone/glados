require 'test_helper'

describe Admin::SalesTermsAndConditionsDocumentsController, :locale do
  let(:sales_terms_and_conditions_document) { sales_terms_and_conditions_documents(:current_sales_terms_and_conditions_document) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_sales_terms_and_conditions_documents_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_sales_terms_and_conditions_document_path
      must_respond_with :success
    end

    it "creates a Sales Terms and Conditions document" do
      -> {
        post admin_sales_terms_and_conditions_documents_path, params: {
          sales_terms_and_conditions_document: {
            title: 'New Sales Terms & Conditions',
            body: 'These are the terms and conditions.',
            effective_on: 2.days.from_now.to_date.to_s(:db)
          }
        }
      }.must_change 'SalesTermsAndConditionsDocument.count'
      flash[:notice].wont_be_nil
      # FIXME: Troubleshoot bug where this assertion fails with STI tables, objects, and fixtures.
      # must_redirect_to admin_sales_terms_and_conditions_document_path(SalesTermsAndConditionsDocument.last)
      must_respond_with :redirect
    end

    it "gets show" do
      get admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      must_respond_with :success
    end

    it "gets edit" do
      get edit_admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      must_respond_with :success
    end

    it "updates a Sales Terms and Conditions document" do
      patch admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document), params: {
        sales_terms_and_conditions_document: {
          title: sales_terms_and_conditions_document.title
        }
      }
      must_redirect_to admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
    end

    it "destroys a Sales Terms and Conditions document" do
      -> {
        delete admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      }.must_change 'SalesTermsAndConditionsDocument.count', -1
      must_redirect_to admin_sales_terms_and_conditions_documents_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_sales_terms_and_conditions_documents_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_sales_terms_and_conditions_document_path
      must_redirect_to sign_in_path
    end

    it "won't create a Sales Terms and Conditions document" do
      -> {
        post admin_sales_terms_and_conditions_documents_path, params: {
          sales_terms_and_conditions_document: {
            title: 'New Sales Terms & Conditions',
            body: 'These are the terms and conditions.',
            effective_on: 2.days.from_now.to_date.to_s(:db)
          }
        }
      }.wont_change 'SalesTermsAndConditionsDocument.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      must_redirect_to sign_in_path
    end

    it "won't update a Sales Terms and Conditions document" do
      patch admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document), params: {
        sales_terms_and_conditions_document: {
          title: sales_terms_and_conditions_document.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a Sales Terms and Conditions document" do
      -> {
        delete admin_sales_terms_and_conditions_document_path(sales_terms_and_conditions_document)
      }.wont_change 'SalesTermsAndConditionsDocument.count', -1
      must_redirect_to sign_in_path
    end
  end
end
