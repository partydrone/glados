require 'test_helper'

describe Admin::DownloadTypesController, :locale do
  let(:download_type) { download_types(:software) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :download_type_manager
      end

      it "gets index" do
        get admin_download_types_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_download_type_path
        must_respond_with :success
      end

      it "creates a download type" do
        -> {
          post admin_download_types_path, params: {
            download_type: {
              name: 'System One',
              position: '4'
            }
          }
        }.must_change 'DownloadType.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_download_types_path
      end

      # it "gets show" do
      #   get admin_download_type_path(download_type)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_download_type_path(download_type)
        must_respond_with :success
      end

      it "updates a download type" do
        patch admin_download_type_path(download_type), params: {
          download_type: {
            name: download_type.name
          }
        }
        must_redirect_to admin_download_types_path
      end

      it "destroys a download type" do
        -> {
          delete admin_download_type_path(download_type)
        }.must_change 'DownloadType.count', -1
        must_redirect_to admin_download_types_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_download_types_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_download_type_path
        must_redirect_to root_path
      end

      it "won't create a download type" do
        -> {
          post admin_download_types_path, params: {
            download_type: {
              name: 'System One',
              position: '4'
            }
          }
        }.wont_change 'DownloadType.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_download_type_path(download_type)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_download_type_path(download_type)
        must_redirect_to root_path
      end

      it "won't update a download type" do
        patch admin_download_type_path(download_type), params: {
          download_type: {
            name: download_type.name
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a download type" do
        -> {
          delete admin_download_type_path(download_type)
        }.wont_change 'DownloadType.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenicated user" do
    it "prohibits index" do
      get admin_download_types_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_download_type_path
      must_redirect_to sign_in_path
    end

    it "won't create a download type" do
      -> {
        post admin_download_types_path, params: {
          download_type: {
            name: 'System One',
            position: '4'
          }
        }
      }.wont_change 'DownloadType.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_download_type_path(download_type)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_download_type_path(download_type)
      must_redirect_to sign_in_path
    end

    it "won't update a download type" do
      patch admin_download_type_path(download_type), params: {
        download_type: {
          name: download_type.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a download type" do
      -> {
        delete admin_download_type_path(download_type)
      }.wont_change 'DownloadType.count', -1
      must_redirect_to sign_in_path
    end
  end
end
