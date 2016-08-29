require 'test_helper'

describe IdentitiesController, :locale do
  it "gets new" do
    get new_identity_path
    must_respond_with :success
  end

  it "handles authentication failures" do
    get auth_failure_path, params: {message: 'invalid_credentials'}
    must_respond_with :redirect
    flash[:alert].wont_be_nil
  end
end
