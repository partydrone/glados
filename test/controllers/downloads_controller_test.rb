require 'test_helper'

describe DownloadsController, :locale do
  let(:download) { downloads(:software_app) }

  it "gets index" do
    get downloads_path
    must_respond_with :success
  end

  it "gets new" do
    get new_download_path
    must_respond_with :success
  end

  it "creates a download" do
    -> {
      post downloads_path, params: {
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
    must_redirect_to downloads_path
  end

  # it "gets show" do
  #   get download_path(download)
  #   must_respond_with :success
  # end

  it "gets edit" do
    get edit_download_path(download)
    must_respond_with :success
  end

  it "updates a download" do
    patch download_path(download), params: {
      download: {
        title: download.title
      }
    }
    must_redirect_to downloads_path
  end

  it "destroys a download" do
    -> {
      delete download_path(download)
    }.must_change 'Download.count', -1
    must_redirect_to downloads_path
  end
end
