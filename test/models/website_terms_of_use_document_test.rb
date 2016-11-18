require 'test_helper'

describe WebsiteTermsOfUseDocument do
  let(:website_terms_of_use_document) { WebsiteTermsOfUseDocument.new(title: 'Terms', body: 'These are the terms.', effective_on: 1.week.ago.to_date.to_s(:db)) }

  it "is a valid object" do
    website_terms_of_use_document.must_be :valid?
  end

  it "gets the current version" do
    current = website_terms_of_use_documents(:current_website_terms_of_use_document)
    WebsiteTermsOfUseDocument.current.must_equal current
  end
end
