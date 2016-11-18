class LegalController < ApplicationController
  def index
    @patents                                       = Patent.includes(:products).order('number')
    @return_material_authorization_policy_document = ReturnMaterialAuthorizationPolicyDocument.current
    @sales_terms_and_conditions_document           = SalesTermsAndConditionsDocument.current
    @website_privacy_policy_document               = WebsitePrivacyPolicyDocument.current
    @website_terms_of_use_document                 = WebsiteTermsOfUseDocument.current
  end
end
