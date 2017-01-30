module Support
  class BaseController < ApplicationController
    def index
      @product_types = ProductType.includes(:products).select('product_types.name, product_types.icon_image_id, products.id, products.name').reorder('product_types.position', 'products.name')
    end

    def select_product
      @product = Product.find(params[:product])
      redirect_to product_path(@product, anchor: 'support') if params[:product]
    end
  end
end
