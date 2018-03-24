class FeaturesController < ApplicationController
  def show
    @feature = Feature.find(params[:id])
    @related_features = @feature.find_related_tags.limit(3)
    @related_products = @feature.products
  end
end
