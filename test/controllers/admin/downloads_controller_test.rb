require 'test_helper'

describe Admin::DownloadsController, :locale do
  let(:download) { downloads(:software_app) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :download_manager
      end
      
      it "gets index" do
        get admin_downloads_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_download_path
        must_respond_with :success
      end

      it "creates a download" do
        -> {
          post admin_downloads_path, params: {
            download: {
              locale: 'en',
              title: 'Data Sheet',
              part_number: '101-0003',
              download_type_id: download_types(:data_sheet).id,
              attachment_data: nil
            }
          }
        }.must_change 'Download.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_downloads_path
      end

      # it "gets show" do
      #   get admin_download_path(download)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_download_path(download)
        must_respond_with :success
      end

      it "updates a download" do
        patch admin_download_path(download), params: {
          download: {
            title: download.title
          }
        }
        must_redirect_to admin_downloads_path
      end

      it "destroys a download" do
        -> {
          delete admin_download_path(download)
        }.must_change 'Download.count', -1
        must_redirect_to admin_downloads_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_downloads_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_download_path
        must_redirect_to root_path
      end

      it "won't create a download" do
        -> {
          post admin_downloads_path, params: {
            download: {
              locale: 'en',
              title: 'Data Sheet',
              part_number: '101-0003',
              download_type_id: download_types(:data_sheet).id,
              attachment_data: nil
            }
          }
        }.wont_change 'Download.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_download_path(download)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_download_path(download)
        must_redirect_to root_path
      end

      it "won't update a download" do
        patch admin_download_path(download), params: {
          download: {
            title: download.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a download" do
        -> {
          delete admin_download_path(download)
        }.wont_change 'Download.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_downloads_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_download_path
      must_redirect_to sign_in_path
    end

    it "won't create a download" do
      -> {
        post admin_downloads_path, params: {
          download: {
            locale: 'en',
            title: 'Data Sheet',
            part_number: '101-0003',
            download_type_id: download_types(:data_sheet).id,
            attachment_data: nil
          }
        }
      }.wont_change 'Download.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_download_path(download)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_download_path(download)
      must_redirect_to sign_in_path
    end

    it "won't update a download" do
      patch admin_download_path(download), params: {
        download: {
          title: download.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a download" do
      -> {
        delete admin_download_path(download)
      }.wont_change 'Download.count', -1
      must_redirect_to sign_in_path
    end
  end
end
