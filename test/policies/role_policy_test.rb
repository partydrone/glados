require 'test_helper'

class RolePolicyTest < ActiveSupport::TestCase
  let(:role) { roles(:one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :role_manager].each do |r|
      before do
        user.add_role r
      end

      it "permits index" do
        :role.must_permit user, :index
      end

      # it "permits show" do
      #   role.must_permit user, :show
      # end

      it "permits new" do
        role.must_permit user, :new
      end

      it "permits create" do
        role.must_permit user, :create
      end

      it "permits edit" do
        role.must_permit user, :edit
      end

      it "permits update" do
        role.must_permit user, :update
      end

      it "permits destroy" do
        role.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :role.wont_permit user, :index
    end

    # it "prohibits show" do
    #   role.wont_permit user, :show
    # end

    it "prohibits new" do
      role.wont_permit user, :new
    end

    it "prohibits create" do
      role.wont_permit user, :create
    end

    it "prohibits edit" do
      role.wont_permit user, :edit
    end

    it "prohibits update" do
      role.wont_permit user, :update
    end

    it "prohibits destroy" do
      role.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :role.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   role.wont_permit nil, :show
    # end

    it "prohibits new" do
      role.wont_permit nil, :new
    end

    it "prohibits create" do
      role.wont_permit nil, :create
    end

    it "prohibits edit" do
      role.wont_permit nil, :edit
    end

    it "prohibits update" do
      role.wont_permit nil, :update
    end

    it "prohibits destroy" do
      role.wont_permit nil, :destroy
    end
  end
end
