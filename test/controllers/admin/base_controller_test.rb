require 'test_helper'

describe Admin::BaseController, :locale do
  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "should get index" do
      get admin_root_path
      must_respond_with :success
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_root_path
      must_respond_with :redirect
    end
  end
end
