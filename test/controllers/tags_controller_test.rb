require 'test_helper'

describe TagsController, :locale do
  let(:tag) { tags(:intersection) }

  it "gets show" do
    get tag_path(tag.name)
    assert_response :success
  end
end
