require 'test_helper'

describe Admin::UsersController, :locale do
  let(:user) { users(:frodo) }

  it "gets index" do
    get admin_users_path
    must_respond_with :success
  end
end
