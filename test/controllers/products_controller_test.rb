require 'test_helper'

describe ProductsController, :locale do
  let(:product) { products(:smartsensor_hd) }

  it "gets index" do
    get products_path
    must_respond_with :success
  end

  it "gets list" do
    get list_products_path
    must_respond_with :success
  end

  it "gets new" do
    get new_product_path
    must_respond_with :success
  end

  it "creates a product" do
    -> {
      post products_path, params: {
        product: {
          name: 'System One',
          part_number: '500-0001',
          expired_on: '',
          product_category_id: product_categories(:arterial).id
        }
      }
    }.must_change 'Product.count'
    flash[:notice].wont_be_nil
    must_redirect_to product_path(Product.last)
  end

  it "gets show" do
    get product_path(product)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_product_path(product)
    must_respond_with :success
  end

  it "updates a product" do
    patch product_path(product), params: {
      product: {
        name: product.name
      }
    }
    must_redirect_to product_path(product)
  end

  it "destroys a product" do
    -> {
      delete product_path(product)
    }.must_change 'Product.count', -1
    must_redirect_to list_products_path
  end
end
