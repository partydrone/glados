require 'test_helper'

describe ProductTypesController, :locale do
  let(:product_type) { product_types(:detection) }

  it "gets index" do
    get product_types_path
    must_respond_with :success
  end

  it "gets new" do
    get new_product_type_path
    must_respond_with :success
  end

  it "creates a Product Type" do
    -> {
      post product_types_path, params: {
        product_type: {
          name: 'System One',
          position: '4'
        }
      }
    }.must_change 'ProductType.count'
    flash[:notice].wont_be_nil
    must_redirect_to product_types_path
  end

  # it "gets show" do
  #   get product_type_path(product_type)
  #   must_respond_with :success
  # end

  it "gets edit" do
    get edit_product_type_path(product_type)
    must_respond_with :success
  end

  it "updates a Product Type" do
    patch product_type_path(product_type), params: {
      product_type: {
        name: product_type.name
      }
    }
    must_redirect_to product_types_path
  end

  it "destroys a Product Type" do
    -> {
      delete product_type_path(product_type)
    }.must_change 'ProductType.count', -1
    must_redirect_to product_types_path
  end
end
