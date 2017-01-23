class WebsitePrivacyPolicyDocumentsController < ApplicationController
  def index
    @website_privacy_policy_documents = WebsitePrivacyPolicyDocument.order(modified_at: :desc)
  end

  def show
    @website_privacy_policy_document = WebsitePrivacyPolicyDocument.find(params[:id])
  end
end
