require 'test_helper'

describe SalesTermsAndConditionsDocument do
  let(:sales_terms_and_conditions_document) { SalesTermsAndConditionsDocument.new(title: 'Terms', body: 'These are the terms.', effective_on: 1.week.ago.to_date.to_s(:db)) }

  it "is a valid object" do
    sales_terms_and_conditions_document.must_be :valid?
  end
end
