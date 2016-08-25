require 'test_helper'

describe UsersController do
  let(:user) { user(:guest) }

  it "gets index" do
    get users_path, locale: :en
    must_respond_with :success
  end

  it "gets show" do
    get user_path(user)
    must_respond_with :success
  end
end
