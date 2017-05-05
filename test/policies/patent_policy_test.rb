require 'test_helper'

class PatentPolicyTest < ActiveSupport::TestCase
  let(:patent) { patents(:vehicular_traffic_sensor) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :patent_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :patent.must_permit user, :index
      end

      # it "permits show" do
      #   patent.must_permit user, :show
      # end

      it "permits new" do
        patent.must_permit user, :new
      end

      it "permits create" do
        patent.must_permit user, :create
      end

      it "permits edit" do
        patent.must_permit user, :edit
      end

      it "permits update" do
        patent.must_permit user, :update
      end

      it "permits destroy" do
        patent.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :patent.wont_permit user, :index
    end

    # it "prohibits show" do
    #   patent.wont_permit user, :show
    # end

    it "prohibits new" do
      patent.wont_permit user, :new
    end

    it "prohibits create" do
      patent.wont_permit user, :create
    end

    it "prohibits edit" do
      patent.wont_permit user, :edit
    end

    it "prohibits update" do
      patent.wont_permit user, :update
    end

    it "prohibits destroy" do
      patent.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :patent.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   patent.wont_permit nil, :show
    # end

    it "prohibits new" do
      patent.wont_permit nil, :new
    end

    it "prohibits create" do
      patent.wont_permit nil, :create
    end

    it "prohibits edit" do
      patent.wont_permit nil, :edit
    end

    it "prohibits update" do
      patent.wont_permit nil, :update
    end

    it "prohibits destroy" do
      patent.wont_permit nil, :destroy
    end
  end
end
