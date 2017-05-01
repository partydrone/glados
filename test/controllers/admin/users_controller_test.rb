require 'test_helper'

describe Admin::UsersController, :locale do
  let(:user) { users(:frodo) }

  describe "with authenticated user" do
    let(:authenticated_user) { users(:generic_user) }

    before do
      sign_in authenticated_user
    end

    it "gets index" do
      get admin_users_path
      must_respond_with :success
    end

    it "gets edit" do
      get edit_admin_user_path(user)
      must_respond_with :success
    end

    it "updates a user" do
      patch admin_user_path(user), params: {
        user: {
          first_name: 'Pinky'
        }
      }
      must_redirect_to admin_users_path
    end

    it "destroys a user" do
      -> {
        delete admin_user_path(user)
      }.must_change 'User.count', -1
      must_redirect_to admin_users_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_users_path
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_user_path(user)
      must_redirect_to sign_in_path
    end

    it "won't update a user" do
      patch admin_user_path(user), params: {
        user: {
          first_name: 'Pinky'
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a user" do
      -> {
        delete admin_user_path(user)
      }.wont_change 'User.count', -1
      must_redirect_to sign_in_path
    end
  end
end
