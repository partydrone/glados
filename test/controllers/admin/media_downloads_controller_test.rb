require 'test_helper'

describe Admin::MediaDownloadsController, :locale do
  let(:media_download) { media_downloads(:one) }

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
