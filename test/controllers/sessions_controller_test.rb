require 'test_helper'

describe SessionsController, :locale do
  it "gets new" do
    get sign_in_path
    must_respond_with :success
  end

  it "creates a session" do
    skip "Unit test shows blank form values, manual test tries to do a GET redirect which is picked up by the application controller. Need to figure it out."
    post '/auth/identity/callback', env: {'omniauth.auth': OmniAuth.config.mock_auth[:identity]}
    found_user = User.find_by(uid: user.uid)
    cookies[:auth_token].must_equal found_user.auth_token
    must_respond_with :redirect
  end

  it "destroys a session" do
    user = users(:frodo)
    sign_in user
    delete sign_out_path
    cookies[:auth_token].must_be_nil
    must_respond_with :redirect
  end
end
