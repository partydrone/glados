require 'test_helper'

describe Admin::ReturnMaterialAuthorizationPolicyDocumentsController, :locale do
  let(:return_material_authorization_policy_document) { return_material_authorization_policy_documents(:current_rma_policy_document)}

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :return_material_authorization_policy_document_manager
      end

      it "gets index" do
        get admin_return_material_authorization_policy_documents_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_return_material_authorization_policy_document_path
        must_respond_with :success
      end

      it "creates an RMA policy document" do
        -> {
          post admin_return_material_authorization_policy_documents_path, params: {
            return_material_authorization_policy_document: {
              title: 'Policy',
              body: 'These are the policies.',
              effective_on: 2.days.from_now.to_date.to_s(:db)
            }
          }
        }.must_change 'ReturnMaterialAuthorizationPolicyDocument.count'
        flash[:notice].wont_be_nil
        # FIXME: Troubleshoot bug where this assertion fails with STI tables, objects, and fixtures.
        # must_redirect_to admin_return_material_authorization_policy_document_path(ReturnMaterialAuthorizationPolicyDocument.last)
        must_respond_with :redirect
      end

      it "gets show" do
        get admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        must_respond_with :success
      end

      it "gets edit" do
        get edit_admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        must_respond_with :success
      end

      it "updates an RMA policy document" do
        patch admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document), params: {
          return_material_authorization_policy_document: {
            title: return_material_authorization_policy_document.title
          }
        }
        must_redirect_to admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
      end

      it "destroys an RMA policy document" do
        -> {
          delete admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        }.must_change 'ReturnMaterialAuthorizationPolicyDocument.count', -1
        must_redirect_to admin_return_material_authorization_policy_documents_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_return_material_authorization_policy_documents_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_return_material_authorization_policy_document_path
        must_redirect_to root_path
      end

      it "won't create an RMA policy document" do
        -> {
          post admin_return_material_authorization_policy_documents_path, params: {
            return_material_authorization_policy_document: {
              title: 'Policy',
              body: 'These are the policies.',
              effective_on: 2.days.from_now.to_date.to_s(:db)
            }
          }
        }.wont_change 'ReturnMaterialAuthorizationPolicyDocument.count'
        must_redirect_to root_path
      end

      it "prohibits show" do
        get admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        must_redirect_to root_path
      end

      it "won't update an RMA policy document" do
        patch admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document), params: {
          return_material_authorization_policy_document: {
            title: return_material_authorization_policy_document.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy an RMA policy document" do
        -> {
          delete admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
        }.wont_change 'ReturnMaterialAuthorizationPolicyDocument.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_return_material_authorization_policy_documents_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_return_material_authorization_policy_document_path
      must_redirect_to sign_in_path
    end

    it "won't create an RMA policy document" do
      -> {
        post admin_return_material_authorization_policy_documents_path, params: {
          return_material_authorization_policy_document: {
            title: 'Policy',
            body: 'These are the policies.',
            effective_on: 2.days.from_now.to_date.to_s(:db)
          }
        }
      }.wont_change 'ReturnMaterialAuthorizationPolicyDocument.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
      must_redirect_to sign_in_path
    end

    it "won't update an RMA policy document" do
      patch admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document), params: {
        return_material_authorization_policy_document: {
          title: return_material_authorization_policy_document.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy an RMA policy document" do
      -> {
        delete admin_return_material_authorization_policy_document_path(return_material_authorization_policy_document)
      }.wont_change 'ReturnMaterialAuthorizationPolicyDocument.count', -1
      must_redirect_to sign_in_path
    end
  end
end
