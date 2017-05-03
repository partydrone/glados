require 'test_helper'

describe Admin::MediaDownloadsController, :locale do
  let(:media_download) { media_downloads(:one) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :media_download_manager
      end

      it "gets index" do
        get admin_media_downloads_path
        assert_response :success
      end

      it "gets new" do
        get new_admin_media_download_path
        assert_response :success
      end

      it "creates a media download" do
        file = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        -> {
          post admin_media_downloads_path, params: {
            media_download: {
              description: 'Wicked cool picture of wicked cool people.',
              file: {
                id: file.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: file.size
              }.to_json
            }
          }
        }.must_change 'MediaDownload.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_media_downloads_path
      end

      it "gets edit" do
        get edit_admin_media_download_path(media_download)
        assert_response :success
      end

      it "updates a media download" do
        patch admin_media_download_path(media_download), params: {
          media_download: {
            description: 'Use the Force, Luke'
          }
        }
        must_redirect_to admin_media_downloads_path
      end

      it "destroys a media download" do
        -> {
          delete admin_media_download_path(media_download)
        }.must_change 'MediaDownload.count', -1
        must_redirect_to admin_media_downloads_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_media_downloads_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_media_download_path
        must_redirect_to root_path
      end

      it "won't create a media download" do
        file = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        -> {
          post admin_media_downloads_path, params: {
            media_download: {
              description: 'Wicked cool picture of wicked cool people.',
              file: {
                id: file.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: file.size
              }.to_json
            }
          }
        }.wont_change 'MediaDownload.count'
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_media_download_path(media_download)
        must_redirect_to root_path
      end

      it "won't update a media download" do
        patch admin_media_download_path(media_download), params: {
          media_download: {
            description: 'Use the Force, Luke'
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a media download" do
        -> {
          delete admin_media_download_path(media_download)
        }.wont_change 'MediaDownload.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_media_downloads_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_media_download_path
      must_redirect_to sign_in_path
    end

    it "won't create a media download" do
      file = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_media_downloads_path, params: {
          media_download: {
            description: 'Wicked cool picture of wicked cool people.',
            file: {
              id: file.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: file.size
            }.to_json
          }
        }
      }.wont_change 'MediaDownload.count'
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_media_download_path(media_download)
      must_redirect_to sign_in_path
    end

    it "won't update a media download" do
      patch admin_media_download_path(media_download), params: {
        media_download: {
          description: 'Use the Force, Luke'
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a media download" do
      -> {
        delete admin_media_download_path(media_download)
      }.wont_change 'MediaDownload.count', -1
      must_redirect_to sign_in_path
    end
  end
end
