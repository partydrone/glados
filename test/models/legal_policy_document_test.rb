require 'test_helper'

describe LegalPolicyDocument do
  let(:legal_policy_document) { LegalPolicyDocument.new(title: 'Policy', body: 'This is the policy.', effective_on: Date.today.to_s(:db)) }

  it "is a valid object" do
    legal_policy_document.must_be :valid?
  end

  it "requires a title" do
    legal_policy_document.title = ' '
    legal_policy_document.wont_be :valid?
  end

  it "requires text content" do
    legal_policy_document.body = ' '
    legal_policy_document.wont_be :valid?
  end

  it "requires an effective date" do
    legal_policy_document.effective_on = ' '
    legal_policy_document.wont_be :valid?
  end
end
