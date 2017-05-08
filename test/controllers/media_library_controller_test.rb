require 'test_helper'

describe MediaLibraryController, :locale do
  it "gets index" do
    get media_downloads_index_path
    must_respond_with :success
  end
end
