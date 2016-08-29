require 'test_helper'

describe UsersController, :locale do
  let(:user) { users(:frodo) }

  it "gets index" do
    get users_path
    must_respond_with :success
  end

  it "gets show" do
    get user_path(user)
    must_respond_with :success
  end
end
