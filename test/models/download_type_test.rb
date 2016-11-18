require 'test_helper'

describe DownloadType do
  let(:download_type) { DownloadType.new(name: 'Software') }

  it "is a valid object" do
    download_type.must_be :valid?
  end

  it "requires a name" do
    download_type.name = ' '
    download_type.wont_be :valid?
  end

  # it "has downloads" do
  #   download_type.must_respond_to :downloads
  # end
end
