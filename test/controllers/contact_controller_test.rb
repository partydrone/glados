require 'test_helper'

describe ContactController, :locale do
  it "gets index" do
    get contact_path
    must_respond_with :success
  end
end
