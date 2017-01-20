class WebsitePrivacyPolicyDocumentsController < ApplicationController
  before_action :set_website_privacy_policy_document, only: [:show, :edit, :update, :destroy]

  def index
    @website_privacy_policy_documents = WebsitePrivacyPolicyDocument.all
  end

  def show
  end
  
  private

  def set_website_privacy_policy_document
    @website_privacy_policy_document = WebsitePrivacyPolicyDocument.find(params[:id])
  end

  def website_privacy_policy_document_params
    params.require(:website_privacy_policy_document).permit(:title, :body, :effective_on)
  end
end
