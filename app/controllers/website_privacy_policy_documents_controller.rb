class WebsitePrivacyPolicyDocumentsController < ApplicationController
  def index
    @website_privacy_policy_documents = WebsitePrivacyPolicyDocument.order(modified_at: :desc)
  end

  def show
    @legal_policy_document = WebsitePrivacyPolicyDocument.find(params[:id])
    render 'legal_policy_documents/show'
  end
end
