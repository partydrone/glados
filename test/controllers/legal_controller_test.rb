require 'test_helper'

describe LegalController, :locale do
  it "gets index" do
    get legal_path
    must_respond_with :success
  end
end
