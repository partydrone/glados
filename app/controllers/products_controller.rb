class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.available.active.where(product_type: ProductType.first)
    @product_types = ProductType.available.active[1..-1]
  end

  def show
    @product = Product.includes({downloads: [:download_type]}, :training_courses, :features, :product_category).find(params[:id])
  end
end
