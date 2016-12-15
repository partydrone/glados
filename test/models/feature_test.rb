require 'test_helper'

describe Feature do
  let(:cool_feature) { Feature.new(title: 'Product Feature', description: 'Feature description.', body: 'Post body text.') }

  it "is a valid object" do
    cool_feature.must_be :valid?
  end

  it "has a hero image" do
    cool_feature.must_respond_to :hero_image
  end

  it "has a YouTube video ID" do
    cool_feature.must_respond_to :youtube_video_id
  end

  it "requires a description" do
    cool_feature.description = ' '
    cool_feature.wont_be :valid?
  end

  it "has a body" do
    cool_feature.must_respond_to :body
  end

  it "has associated products" do
    cool_feature.must_respond_to :products
  end
end
