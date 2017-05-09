require 'test_helper'

class ProductPolicyTest < ActiveSupport::TestCase
  let(:product) { products(:smartsensor_hd) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :product_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :product.must_permit user, :index
      end

      it "permits show" do
        product.must_permit user, :show
      end

      it "permits new" do
        product.must_permit user, :new
      end

      it "permits create" do
        product.must_permit user, :create
      end

      it "permits edit" do
        product.must_permit user, :edit
      end

      it "permits update" do
        product.must_permit user, :update
      end

      it "permits destroy" do
        product.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :product.wont_permit user, :index
    end

    it "prohibits show" do
      product.wont_permit user, :show
    end

    it "prohibits new" do
      product.wont_permit user, :new
    end

    it "prohibits create" do
      product.wont_permit user, :create
    end

    it "prohibits edit" do
      product.wont_permit user, :edit
    end

    it "prohibits update" do
      product.wont_permit user, :update
    end

    it "prohibits destroy" do
      product.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :product.wont_permit nil, :index
    end

    it "prohibits show" do
      product.wont_permit nil, :show
    end

    it "prohibits new" do
      product.wont_permit nil, :new
    end

    it "prohibits create" do
      product.wont_permit nil, :create
    end

    it "prohibits edit" do
      product.wont_permit nil, :edit
    end

    it "prohibits update" do
      product.wont_permit nil, :update
    end

    it "prohibits destroy" do
      product.wont_permit nil, :destroy
    end
  end
end
