class ReturnMaterialAuthorizationPolicyDocumentsController < ApplicationController
  def show
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.find(params[:id])
  end
end
