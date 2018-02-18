require 'test_helper'

describe Admin::SoftwareDownloadsController, :locale do
  let(:support_download) { support_downloads(:software_app) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :support_download_manager
      end

      it "gets index" do
        get admin_support_downloads_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_support_download_path
        must_respond_with :success
      end

      it "creates a support_download" do
        -> {
          post admin_support_downloads_path, params: {
            support_download: {
              title: 'Data Sheet',
              attachment_data: nil
            }
          }
        }.must_change 'SoftwareDownload.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_support_downloads_path
      end

      # it "gets show" do
      #   get admin_support_download_path(support_download)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_support_download_path(support_download)
        must_respond_with :success
      end

      it "updates a support_download" do
        patch admin_support_download_path(support_download), params: {
          support_download: {
            title: support_download.title
          }
        }
        must_redirect_to admin_support_downloads_path
      end

      it "destroys a support_download" do
        -> {
          delete admin_support_download_path(support_download)
        }.must_change 'SoftwareDownload.count', -1
        must_redirect_to admin_support_downloads_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_support_downloads_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_support_download_path
        must_redirect_to root_path
      end

      it "won't create a support_download" do
        -> {
          post admin_support_downloads_path, params: {
            support_download: {
              locale: 'en',
              title: 'Data Sheet',
              part_number: '101-0003',
              support_download_type_id: support_download_types(:data_sheet).id,
              attachment_data: nil
            }
          }
        }.wont_change 'SoftwareDownload.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_support_download_path(support_download)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_support_download_path(support_download)
        must_redirect_to root_path
      end

      it "won't update a support_download" do
        patch admin_support_download_path(support_download), params: {
          support_download: {
            title: support_download.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a support_download" do
        -> {
          delete admin_support_download_path(support_download)
        }.wont_change 'SoftwareDownload.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_support_downloads_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_support_download_path
      must_redirect_to sign_in_path
    end

    it "won't create a support_download" do
      -> {
        post admin_support_downloads_path, params: {
          support_download: {
            locale: 'en',
            title: 'Data Sheet',
            part_number: '101-0003',
            support_download_type_id: support_download_types(:data_sheet).id,
            attachment_data: nil
          }
        }
      }.wont_change 'SoftwareDownload.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_support_download_path(support_download)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_support_download_path(support_download)
      must_redirect_to sign_in_path
    end

    it "won't update a support_download" do
      patch admin_support_download_path(support_download), params: {
        support_download: {
          title: support_download.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a support_download" do
      -> {
        delete admin_support_download_path(support_download)
      }.wont_change 'SoftwareDownload.count', -1
      must_redirect_to sign_in_path
    end
  end
end
