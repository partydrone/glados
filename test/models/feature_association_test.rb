require 'test_helper'

describe FeatureAssociation do
  let(:feature_association) { FeatureAssociation.new(feature_id: features(:dual_radar).id, product_id: products(:smartsensor_hd).id, position: 1) }

  it "is a valid object" do
    feature_association.must_be :valid?
  end

  it "has an associated feature" do
    feature_association.must_respond_to :feature
  end

  it "has an associated product" do
    feature_association.must_respond_to :product
  end

  it "is sortable" do
    feature_association.must_respond_to :position
  end
end
