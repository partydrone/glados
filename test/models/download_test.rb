require 'test_helper'

describe Download do
  let(:download) { Download.new(locale: 'en', title: 'User Guide', part_number: '101-0042', download_type_id: download_types(:software).id, attachment_data: nil) }

  it "is a valid object" do
    download.must_be :valid?
  end

  it "has a locale" do
    download.locale = ' '
    download.wont_be :valid?
  end

  it "requires a title" do
    download.title = ' '
    download.wont_be :valid?
  end

  it "has a part number" do
    download.must_respond_to :part_number
  end

  it "is associated with a download type" do
    download.must_respond_to :download_type
  end

  it "has associated products" do
    download.must_respond_to :products
  end
end
