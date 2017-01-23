require 'test_helper'

describe ReturnMaterialAuthorizationPolicyDocumentsController, :locale do
  it "gets index" do
    get return_material_authorization_policy_documents_path
    must_respond_with :success
  end

  it "gets show" do
    get return_material_authorization_policy_document_path(return_material_authorization_policy_documents(:current_rma_policy_document))
    must_respond_with :success
  end
end
