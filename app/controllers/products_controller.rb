class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.includes(:products).where(product_type: ProductType.first)
    @product_types = ProductType.includes(:product_categories).all[1..-1]
  end

  def show
    @product = Product.includes({downloads: [:download_type]}, :training_courses, :features, :product_category).find(params[:id])     
  end
end
