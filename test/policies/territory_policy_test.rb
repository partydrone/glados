require 'test_helper'

class TerritoryPolicyTest < ActiveSupport::TestCase
  let(:territory) { territories(:new_territory) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :territory_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :territory.must_permit user, :index
      end

      it "permits show" do
        territory.must_permit user, :show
      end

      it "permits new" do
        territory.must_permit user, :new
      end

      it "permits create" do
        territory.must_permit user, :create
      end

      it "permits edit" do
        territory.must_permit user, :edit
      end

      it "permits update" do
        territory.must_permit user, :update
      end

      it "permits destroy" do
        territory.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :territory.wont_permit user, :index
    end

    it "prohibits show" do
      territory.wont_permit user, :show
    end

    it "prohibits new" do
      territory.wont_permit user, :new
    end

    it "prohibits create" do
      territory.wont_permit user, :create
    end

    it "prohibits edit" do
      territory.wont_permit user, :edit
    end

    it "prohibits update" do
      territory.wont_permit user, :update
    end

    it "prohibits destroy" do
      territory.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :territory.wont_permit nil, :index
    end

    it "prohibits show" do
      territory.wont_permit nil, :show
    end

    it "prohibits new" do
      territory.wont_permit nil, :new
    end

    it "prohibits create" do
      territory.wont_permit nil, :create
    end

    it "prohibits edit" do
      territory.wont_permit nil, :edit
    end

    it "prohibits update" do
      territory.wont_permit nil, :update
    end

    it "prohibits destroy" do
      territory.wont_permit nil, :destroy
    end
  end
end
