class WebsitePrivacyPolicyDocumentsController < ApplicationController
  def show
    @website_privacy_policy_document = WebsitePrivacyPolicyDocument.find(params[:id])
  end
end
