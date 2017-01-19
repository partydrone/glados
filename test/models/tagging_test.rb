require 'test_helper'

describe Tagging do
  let(:tagging) { Tagging.new }

  it "is a valid object" do
    tagging.must_be :valid?
  end
end
