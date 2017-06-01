require 'test_helper'

class SalesRegionPolicyTest < ActiveSupport::TestCase
  let(:sales_region) { sales_regions(:new_sales_region) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :sales_region_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :sales_region.must_permit user, :index
      end

      it "permits show" do
        sales_region.must_permit user, :show
      end

      it "permits new" do
        sales_region.must_permit user, :new
      end

      it "permits create" do
        sales_region.must_permit user, :create
      end

      it "permits edit" do
        sales_region.must_permit user, :edit
      end

      it "permits update" do
        sales_region.must_permit user, :update
      end

      it "permits destroy" do
        sales_region.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :sales_region.wont_permit user, :index
    end

    it "prohibits show" do
      sales_region.wont_permit user, :show
    end

    it "prohibits new" do
      sales_region.wont_permit user, :new
    end

    it "prohibits create" do
      sales_region.wont_permit user, :create
    end

    it "prohibits edit" do
      sales_region.wont_permit user, :edit
    end

    it "prohibits update" do
      sales_region.wont_permit user, :update
    end

    it "prohibits destroy" do
      sales_region.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :sales_region.wont_permit nil, :index
    end

    it "prohibits show" do
      sales_region.wont_permit nil, :show
    end

    it "prohibits new" do
      sales_region.wont_permit nil, :new
    end

    it "prohibits create" do
      sales_region.wont_permit nil, :create
    end

    it "prohibits edit" do
      sales_region.wont_permit nil, :edit
    end

    it "prohibits update" do
      sales_region.wont_permit nil, :update
    end

    it "prohibits destroy" do
      sales_region.wont_permit nil, :destroy
    end
  end
end
