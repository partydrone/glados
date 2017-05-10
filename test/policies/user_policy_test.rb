require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  let(:user) { users(:generic_user) }
  let(:admin) { users(:admin) }

  describe "for authorized admin" do
    [:admin, :user_manager].each do |role|
      before do
        admin.add_role role
      end

      it "permits index" do
        :user.must_permit admin, :index
      end

      # it "permits show" do
      #   user.must_permit admin, :show
      # end

      # it "permits new" do
      #   user.must_permit admin, :new
      # end

      # it "permits create" do
      #   user.must_permit admin, :create
      # end

      it "permits edit" do
        user.must_permit admin, :edit
      end

      it "permits update" do
        user.must_permit admin, :update
      end

      it "permits destroy" do
        user.must_permit admin, :destroy
      end

      it "prohibits destroy on own record" do
        admin.wont_permit admin, :destroy
      end
    end
  end

  describe "for unauthorized admin" do
    it "prohibits index" do
      :user.wont_permit admin, :index
    end

    # it "prohibits show" do
    #   user.wont_permit admin, :show
    # end

    # it "prohibits new" do
    #   user.wont_permit admin, :new
    # end

    # it "prohibits create" do
    #   user.wont_permit admin, :create
    # end

    it "prohibits edit" do
      user.wont_permit admin, :edit
    end

    it "prohibits update" do
      user.wont_permit admin, :update
    end

    it "prohibits destroy" do
      user.wont_permit admin, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :user.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   user.wont_permit nil, :show
    # end

    # it "prohibits new" do
    #   user.wont_permit nil, :new
    # end

    # it "prohibits create" do
    #   user.wont_permit nil, :create
    # end

    it "prohibits edit" do
      user.wont_permit nil, :edit
    end

    it "prohibits update" do
      user.wont_permit nil, :update
    end

    it "prohibits destroy" do
      user.wont_permit nil, :destroy
    end
  end
end
