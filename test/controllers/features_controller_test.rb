require 'test_helper'

describe FeaturesController, :locale do
  it "gets show" do
    get feature_path(features(:dual_radar))
    must_respond_with :success
  end
end
