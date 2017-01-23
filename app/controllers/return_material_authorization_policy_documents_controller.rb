class ReturnMaterialAuthorizationPolicyDocumentsController < ApplicationController
  def index
    @return_material_authorization_policy_documents = ReturnMaterialAuthorizationPolicyDocument.order(modified_at: :desc)
  end

  def show
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.find(params[:id])
  end
end
