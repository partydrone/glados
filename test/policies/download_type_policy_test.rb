require 'test_helper'

class DownloadTypePolicyTest < ActiveSupport::TestCase
  let(:download_type) { download_types(:software) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :download_type_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :download_type.must_permit user, :index
      end

      # it "permits show" do
      #   download_type.must_permit user, :show
      # end

      it "permits new" do
        download_type.must_permit user, :new
      end

      it "permits create" do
        download_type.must_permit user, :create
      end

      it "permits edit" do
        download_type.must_permit user, :edit
      end

      it "permits update" do
        download_type.must_permit user, :update
      end

      it "permits destroy" do
        download_type.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :download_type.wont_permit user, :index
    end

    # it "prohibits show" do
    #   download_type.wont_permit user, :show
    # end

    it "prohibits new" do
      download_type.wont_permit user, :new
    end

    it "prohibits create" do
      download_type.wont_permit user, :create
    end

    it "prohibits edit" do
      download_type.wont_permit user, :edit
    end

    it "prohibits update" do
      download_type.wont_permit user, :update
    end

    it "prohibits destroy" do
      download_type.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :download_type.wont_permit nil, :index
    end

    # it "prohibits show" do
    #   download_type.wont_permit nil, :show
    # end

    it "prohibits new" do
      download_type.wont_permit nil, :new
    end

    it "prohibits create" do
      download_type.wont_permit nil, :create
    end

    it "prohibits edit" do
      download_type.wont_permit nil, :edit
    end

    it "prohibits update" do
      download_type.wont_permit nil, :update
    end

    it "prohibits destroy" do
      download_type.wont_permit nil, :destroy
    end
  end
end
