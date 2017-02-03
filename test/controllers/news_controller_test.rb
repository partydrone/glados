require 'test_helper'

describe NewsController, :locale do
  it "gets index" do
    get news_path
    must_respond_with :success
  end
end
