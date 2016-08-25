require 'test_helper'

describe SessionsController do
  it "gets new" do
    get sign_in_path
    must_respond_with :success
  end

  it "creates a session" do
    user = OmniAuth.config.mock_auth[:identity]
    post '/auth/identity/callback', params: {provider: :identity}, env: {'omniauth.auth': user}
    found_user = User.find_by(uid: user.uid)
    cookies[:auth_token].must_equal found_user.auth_token
    must_respond_with :redirect
  end

  it "destroys a session" do
    user = user(:frodo)
    sign_in user
    get sign_out_path
    cookies[:auth_token].must_be_nil
    must_respond_with :redirect
  end
end
