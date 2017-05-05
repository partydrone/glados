require 'test_helper'

class WebsiteTermsOfUseDocumentPolicyTest < ActiveSupport::TestCase
  let(:website_terms_of_use_document) { website_terms_of_use_documents(:current_website_terms_of_use_document) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :website_terms_of_use_document_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :website_terms_of_use_document.must_permit user, :index
      end

      it "permits show" do
        website_terms_of_use_document.must_permit user, :show
      end

      it "permits new" do
        website_terms_of_use_document.must_permit user, :new
      end

      it "permits create" do
        website_terms_of_use_document.must_permit user, :create
      end

      it "permits edit" do
        website_terms_of_use_document.must_permit user, :edit
      end

      it "permits update" do
        website_terms_of_use_document.must_permit user, :update
      end

      it "permits destroy" do
        website_terms_of_use_document.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :website_terms_of_use_document.wont_permit user, :index
    end

    it "prohibits show" do
      website_terms_of_use_document.wont_permit user, :show
    end

    it "prohibits new" do
      website_terms_of_use_document.wont_permit user, :new
    end

    it "prohibits create" do
      website_terms_of_use_document.wont_permit user, :create
    end

    it "prohibits edit" do
      website_terms_of_use_document.wont_permit user, :edit
    end

    it "prohibits update" do
      website_terms_of_use_document.wont_permit user, :update
    end

    it "prohibits destroy" do
      website_terms_of_use_document.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :website_terms_of_use_document.wont_permit nil, :index
    end

    it "prohibits show" do
      website_terms_of_use_document.wont_permit nil, :show
    end

    it "prohibits new" do
      website_terms_of_use_document.wont_permit nil, :new
    end

    it "prohibits create" do
      website_terms_of_use_document.wont_permit nil, :create
    end

    it "prohibits edit" do
      website_terms_of_use_document.wont_permit nil, :edit
    end

    it "prohibits update" do
      website_terms_of_use_document.wont_permit nil, :update
    end

    it "prohibits destroy" do
      website_terms_of_use_document.wont_permit nil, :destroy
    end
  end
end
