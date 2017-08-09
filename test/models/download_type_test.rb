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

  it "has a position" do
    download_type.must_respond_to :position
  end

  it "has downloads" do
    download_type.must_respond_to :downloads
  end

  it "sets default position when persisted" do
    download_type.position.must_be_nil

    download_type.save!
    download_type.reload

    download_type.position.wont_be_nil
  end
end
