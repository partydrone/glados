require 'test_helper'

describe TagsController, :locale do
  it "gets show" do
    get tag_path(tags(:intersection))
    assert_response :success
  end
end
