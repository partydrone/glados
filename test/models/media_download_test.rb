require 'test_helper'

describe MediaDownload do
  let(:media_download) { MediaDownload.new(description: 'Magical picture of unicorns and rainbows.')}

  it "is a valid object" do
    media_download.must_be :valid?
  end

  it "requires alt text" do
    media_download.description = ' '
    media_download.wont_be :valid?
  end
end
