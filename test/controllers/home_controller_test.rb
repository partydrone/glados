require 'test_helper'

describe HomeController, :locale do
  it "gets index" do
    get root_path
    must_respond_with :success
  end
end
