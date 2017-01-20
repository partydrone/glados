class ProductsController < ApplicationController
  def show
    @product = Product.includes({downloads: [:download_type]}, :features, :product_category).find(params[:id])
    @demo_request = DemoRequest.new(country: 'US')
  end
end
