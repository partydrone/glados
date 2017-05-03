module Admin
  class ReturnMaterialAuthorizationPolicyDocumentsController < BaseController
    before_action :set_return_material_authorization_policy_document, only: [:show, :edit, :update, :destroy]

    def index
      @return_material_authorization_policy_documents = ReturnMaterialAuthorizationPolicyDocument.all
      authorize @return_material_authorization_policy_documents
    end

    def show
      @legal_policy_document = @return_material_authorization_policy_document
    end

    def new
      @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.new
      authorize @return_material_authorization_policy_document
    end

    def edit
    end

    def create
      @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.new(return_material_authorization_policy_document_params)
      authorize @return_material_authorization_policy_document

      if @return_material_authorization_policy_document.save
        redirect_to [:admin, @return_material_authorization_policy_document], notice: %(Saved "#{@return_material_authorization_policy_document.title}" successfully.)
      else
        render :new
      end
    end

    def update
      if @return_material_authorization_policy_document.update(return_material_authorization_policy_document_params)
        redirect_to [:admin, @return_material_authorization_policy_document], notice: %(Updated "#{@return_material_authorization_policy_document.title}" successfully.)
      end
    end

    def destroy
      @return_material_authorization_policy_document.destroy
      redirect_to admin_return_material_authorization_policy_documents_path, notice: %(Deleted "#{@return_material_authorization_policy_document.title}" successfully.)
    end

    private

    def set_return_material_authorization_policy_document
      @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.find(params[:id])
      authorize @return_material_authorization_policy_document
    end

    def return_material_authorization_policy_document_params
      params.require(:return_material_authorization_policy_document).permit(:title, :body, :effective_on)
    end
  end
end
