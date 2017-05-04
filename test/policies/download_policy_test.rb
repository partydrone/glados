require 'test_helper'

class DownloadPolicyTest < ActiveSupport::TestCase
  let(:download) { downloads(:software_app) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :download_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :download.must_permit user, :index
      end

      # it "permits show" do
      #   download.must_permit user, :show
      # end

      it "permits new" do
        download.must_permit user, :new
      end

      it "permits create" do
        download.must_permit user, :create
      end

      it "permits edit" do
        download.must_permit user, :edit
      end

      it "permits update" do
        download.must_permit user, :update
      end

      it "permits destroy" do
        download.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :download.wont_permit user, :index
    end

    # it "prohibits show" do
    #   download.wont_permit user, :show
    # end

    it "prohibits new" do
      download.wont_permit user, :new
    end

    it "prohibits create" do
      download.wont_permit user, :create
    end

    it "prohibits edit" do
      download.wont_permit user, :edit
    end

    it "prohibits update" do
      download.wont_permit user, :update
    end

    it "prohibits destroy" do
      download.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :download.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   download.wont_permit nil, :show
    # end

    it "prohibits new" do
      download.wont_permit nil, :new
    end

    it "prohibits create" do
      download.wont_permit nil, :create
    end

    it "prohibits edit" do
      download.wont_permit nil, :edit
    end

    it "prohibits update" do
      download.wont_permit nil, :update
    end

    it "prohibits destroy" do
      download.wont_permit nil, :destroy
    end
  end
end
