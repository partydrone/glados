require 'test_helper'

describe SupportController, :locale do
  it "gets index" do
    get support_path
    must_respond_with :success
  end
end
