require 'test_helper'

describe TagsController, :locale do
  let(:tag) { ActsAsTaggableOn::Tag.create!(name: 'intersection') }

  it "gets show" do
    get tag_path(tag)
    assert_response :success
  end
end
