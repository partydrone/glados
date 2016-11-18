require 'test_helper'

describe ReturnMaterialAuthorizationPolicyDocument do
  let(:return_material_authorization_policy_document) { ReturnMaterialAuthorizationPolicyDocument.new(title: 'Policy', body: 'This is the policy.', effective_on: 1.week.ago.to_date.to_s(:db)) }

  it "is a valid object" do
    return_material_authorization_policy_document.must_be :valid?
  end

  it "gets the current version" do
    current = return_material_authorization_policy_documents(:current_rma_policy_document)
    ReturnMaterialAuthorizationPolicyDocument.current.must_equal current
  end
end
