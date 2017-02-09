require 'test_helper'

describe MediaDownload do
  let(:media_download) { MediaDownload.new(file_id: 1, description: 'Magical picture of unicorns and rainbows.')}

  it "is a valid object" do
    media_download.must_be :valid?
  end

  it "requires a file" do
    media_download.file_id = ''
    media_download.wont_be :valid?
  end

  it "requires a description" do
    media_download.description = ' '
    media_download.wont_be :valid?
  end
end
