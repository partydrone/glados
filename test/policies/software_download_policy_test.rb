require 'test_helper'

class SoftwareDownloadPolicyTest < ActiveSupport::TestCase
  let(:software_download) { software_downloads(:software_app) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :software_download_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :software_download.must_permit user, :index
      end

      # it "permits show" do
      #   software_download.must_permit user, :show
      # end

      it "permits new" do
        software_download.must_permit user, :new
      end

      it "permits create" do
        software_download.must_permit user, :create
      end

      it "permits edit" do
        software_download.must_permit user, :edit
      end

      it "permits update" do
        software_download.must_permit user, :update
      end

      it "permits destroy" do
        software_download.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :software_download.wont_permit user, :index
    end

    # it "prohibits show" do
    #   software_download.wont_permit user, :show
    # end

    it "prohibits new" do
      software_download.wont_permit user, :new
    end

    it "prohibits create" do
      software_download.wont_permit user, :create
    end

    it "prohibits edit" do
      software_download.wont_permit user, :edit
    end

    it "prohibits update" do
      software_download.wont_permit user, :update
    end

    it "prohibits destroy" do
      software_download.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :software_download.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   software_download.wont_permit nil, :show
    # end

    it "prohibits new" do
      software_download.wont_permit nil, :new
    end

    it "prohibits create" do
      software_download.wont_permit nil, :create
    end

    it "prohibits edit" do
      software_download.wont_permit nil, :edit
    end

    it "prohibits update" do
      software_download.wont_permit nil, :update
    end

    it "prohibits destroy" do
      software_download.wont_permit nil, :destroy
    end
  end
end
