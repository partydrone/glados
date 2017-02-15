class ReturnMaterialAuthorizationPolicyDocumentsController < ApplicationController
  def index
    @return_material_authorization_policy_documents = ReturnMaterialAuthorizationPolicyDocument.order(modified_at: :desc)
  end

  def show
    @legal_policy_document = ReturnMaterialAuthorizationPolicyDocument.find(params[:id])
    render 'legal_policy_documents/show'
  end
end
