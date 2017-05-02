require 'test_helper'

describe Admin::RolesController, :locale do
  let(:role) { Role.create! name: 'janitor' }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_roles_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_role_path
      must_respond_with :success
    end

    it "creates a role" do
      -> {
        post admin_roles_path, params: {
          role: {
            name: 'supervisor'
          }
        }
      }.must_change 'Role.count'
      flash[:notice].wont_be_nil
      must_redirect_to admin_roles_path
    end

    # it "gets show" do
    #   get admin_role_path(role)
    #   must_respond_with :success
    # end

    it "gets edit" do
      get edit_admin_role_path(role)
      must_respond_with :success
    end

    it "updates a role" do
      patch admin_role_path(role), params: {
        role: {
          name: 'manager'
        }
      }
      must_redirect_to admin_roles_path
    end

    it "destroys a role" do
      -> {
        delete admin_role_path(role)
      }.must_change 'Role.count', -1
      must_redirect_to admin_roles_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_roles_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_role_path
      must_redirect_to sign_in_path
    end

    it "won't create a role" do
      -> {
        post admin_roles_path, params: {
          role: {
            name: 'supervisor'
          }
        }
      }.wont_change 'Role.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_role_path(role)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_role_path(role)
      must_redirect_to sign_in_path
    end

    it "won't update a role" do
      patch admin_role_path(role), params: {
        role: {
          name: 'manager'
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a role" do
      -> {
        delete admin_role_path(role)
      }.wont_change 'Role.count', -1
      must_redirect_to sign_in_path
    end
  end
end
