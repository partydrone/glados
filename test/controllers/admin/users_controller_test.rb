require 'test_helper'

describe Admin::UsersController, :locale do
  let(:user) { users(:frodo) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_users_path
      must_respond_with :success
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_users_path
      must_redirect_to sign_in_path
    end
  end
end
