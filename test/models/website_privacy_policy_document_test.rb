require 'test_helper'

describe WebsitePrivacyPolicyDocument do
  let(:website_privacy_policy_document) { WebsitePrivacyPolicyDocument.new(title: 'Terms', body: 'These are the terms.', effective_on: 1.week.ago.to_date.to_s(:db)) }

  it "is a valid object" do
    website_privacy_policy_document.must_be :valid?
  end

  it "gets the current version" do
    current = website_privacy_policy_documents(:current_website_privacy_policy_document)
    WebsitePrivacyPolicyDocument.current.must_equal current
  end
end
