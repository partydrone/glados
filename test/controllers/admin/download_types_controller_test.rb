require 'test_helper'

describe Admin::DownloadTypesController, :locale do
  let(:download_type) { download_types(:software) }

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
