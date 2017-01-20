class ProductCategoriesController < ApplicationController
  def show
    @product_category = ProductCategory.includes(:products).find(params[:id])
  end
end
