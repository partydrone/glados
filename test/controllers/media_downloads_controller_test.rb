require 'test_helper'

describe MediaDownloadsController, :locale do
  it "gets index" do
    get media_downloads_path
    must_respond_with :success
  end
end
