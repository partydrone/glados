require 'test_helper'

describe HomeController do
  it "gets index" do
    get root_path
    must_respond_with :redirect
    follow_redirect!
    must_respond_with :success
  end
end
