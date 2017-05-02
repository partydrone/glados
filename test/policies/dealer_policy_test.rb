require 'test_helper'

class DealerPolicyTest < ActiveSupport::TestCase
  let(:dealer) { dealers(:new_dealer) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :dealer_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :dealer.must_permit user, :index
      end

      it "permits show" do
        dealer.must_permit user, :show
      end

      it "permits new" do
        dealer.must_permit user, :new
      end

      it "permits create" do
        dealer.must_permit user, :create
      end

      it "permits edit" do
        dealer.must_permit user, :edit
      end

      it "permits update" do
        dealer.must_permit user, :update
      end

      it "permits destroy" do
        dealer.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :dealer.wont_permit user, :index
    end

    it "prohibits show" do
      dealer.wont_permit user, :show
    end

    it "prohibits new" do
      dealer.wont_permit user, :new
    end

    it "prohibits create" do
      dealer.wont_permit user, :create
    end

    it "prohibits edit" do
      dealer.wont_permit user, :edit
    end

    it "prohibits update" do
      dealer.wont_permit user, :update
    end

    it "prohibits destroy" do
      dealer.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :dealer.wont_permit nil, :index
    end

    it "prohibits show" do
      dealer.wont_permit nil, :show
    end

    it "prohibits new" do
      dealer.wont_permit nil, :new
    end

    it "prohibits create" do
      dealer.wont_permit nil, :create
    end

    it "prohibits edit" do
      dealer.wont_permit nil, :edit
    end

    it "prohibits update" do
      dealer.wont_permit nil, :update
    end

    it "prohibits destroy" do
      dealer.wont_permit nil, :destroy
    end
  end
end
