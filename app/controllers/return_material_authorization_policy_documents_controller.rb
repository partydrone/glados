class ReturnMaterialAuthorizationPolicyDocumentsController < ApplicationController
  before_action :set_return_material_authorization_policy_document, only: [:show, :edit, :update, :destroy]

  def index
    @return_material_authorization_policy_documents = ReturnMaterialAuthorizationPolicyDocument.all
  end

  def show
  end

 
  private

  def set_return_material_authorization_policy_document
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.find(params[:id])
  end

  def return_material_authorization_policy_document_params
    params.require(:return_material_authorization_policy_document).permit(:title, :body, :effective_on)
  end
end
