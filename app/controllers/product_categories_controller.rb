class ProductCategoriesController < ApplicationController
  def show
    @product_category = ProductCategory.find(params[:id])
  end
end
