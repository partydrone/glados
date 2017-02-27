require 'test_helper'

describe MarketingContentFilter do
  it "returns an empty array if it gets an empty array" do
    collection = []
    MarketingContentFilter.new(collection).filter.must_equal []
  end

  it "returns an empty array if it filters everything out" do
    skip 'TODO: Test empty return value'
  end

  it "doesn't do anything if nothing is filtered" do
    skip 'TODO: Test no change'
  end
end
