class ProductCategoriesController < ApplicationController
  def show
    @product_category = ProductCategory.includes(:active_products).find(params[:id])
  end
end
