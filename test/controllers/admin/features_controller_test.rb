require 'test_helper'

describe Admin::FeaturesController, :locale do
  let(:cool_feature) { features(:dual_radar) }

  it "gets index" do
    get admin_features_path
    must_respond_with :success
  end

  it "gets new" do
    get new_admin_feature_path
    must_respond_with :success
  end

  it "creates a feature" do
    hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
    -> {
      post admin_features_path, params: {
        feature: {
          title:       'System One',
          description: 'Meet the new memeber of the Wavetronix family.',
          body:        'System one has been five years in the making, and it is totally worth the wait!',
          hero_image: {
            id: hero_image.id,
            filename: 'shark.jpg',
            content_type: 'image/jpeg',
            size: hero_image.size
          }.to_json
        }
      }
    }.must_change 'Feature.count'
    flash[:notice].wont_be_nil
    must_redirect_to admin_feature_path(Feature.last)
  end

  it "gets show" do
    get admin_feature_path(cool_feature)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_admin_feature_path(cool_feature)
    must_respond_with :success
  end

  it "updates a feature" do
    patch admin_feature_path(cool_feature), params: {
      feature: {
        title: cool_feature.title
      }
    }
    must_redirect_to admin_feature_path(cool_feature)
  end

  it "destroys a feature" do
    -> {
      delete admin_feature_path(cool_feature)
    }.must_change 'Feature.count', -1
    must_redirect_to admin_features_path
  end
end
