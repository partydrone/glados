require 'test_helper'

describe IdentitiesController do
  it "gets new" do
    get new_identity_path
    follow_redirect!
    must_respond_with :success
  end

  it "handles authentication failures" do
    get auth_failure_path, params: {message: 'invalid_credentials'}
    follow_redirect!
    must_respond_with :redirect
    flash[:alert].wont_be_nil
  end
end
