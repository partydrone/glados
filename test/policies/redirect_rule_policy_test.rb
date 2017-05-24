require 'test_helper'

class RedirectRulePolicyTest < ActiveSupport::TestCase
  let(:redirect_rule) { redirect_rules(:one) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :redirect_rule_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :redirect_rule.must_permit user, :index
      end

      # it "permits show" do
      #   redirect_rule.must_permit user, :show
      # end

      it "permits new" do
        redirect_rule.must_permit user, :new
      end

      it "permits create" do
        redirect_rule.must_permit user, :create
      end

      it "permits edit" do
        redirect_rule.must_permit user, :edit
      end

      it "permits update" do
        redirect_rule.must_permit user, :update
      end

      it "permits destroy" do
        redirect_rule.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :redirect_rule.wont_permit user, :index
    end

    # it "prohibits show" do
    #   redirect_rule.wont_permit user, :show
    # end

    it "prohibits new" do
      redirect_rule.wont_permit user, :new
    end

    it "prohibits create" do
      redirect_rule.wont_permit user, :create
    end

    it "prohibits edit" do
      redirect_rule.wont_permit user, :edit
    end

    it "prohibits update" do
      redirect_rule.wont_permit user, :update
    end

    it "prohibits destroy" do
      redirect_rule.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :redirect_rule.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   redirect_rule.wont_permit nil, :show
    # end

    it "prohibits new" do
      redirect_rule.wont_permit nil, :new
    end

    it "prohibits create" do
      redirect_rule.wont_permit nil, :create
    end

    it "prohibits edit" do
      redirect_rule.wont_permit nil, :edit
    end

    it "prohibits update" do
      redirect_rule.wont_permit nil, :update
    end

    it "prohibits destroy" do
      redirect_rule.wont_permit nil, :destroy
    end
  end
end
