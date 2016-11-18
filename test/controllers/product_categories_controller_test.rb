require 'test_helper'

describe ProductCategoriesController, :locale do
  let(:product_category) { product_categories(:intersection) }

  it "gets index" do
    get product_categories_path
    must_respond_with :success
  end

  it "gets new" do
    get new_product_category_path
    must_respond_with :success
  end

  it "creates a product category" do
    -> {
      post product_categories_path, params: {
        product_category: {
          name: 'System One',
          position: '4',
          product_type_id: product_types(:detection).id
        }
      }
    }.must_change 'ProductCategory.count'
    flash[:notice].wont_be_nil
    must_redirect_to product_categories_path
  end

  # it "gets show" do
  #   get product_category_path(product_category)
  #   must_respond_with :success
  # end

  it "gets edit" do
    get edit_product_category_path(product_category)
    must_respond_with :success
  end

  it "updates a product category" do
    patch product_category_path(product_category), params: {
      product_category: {
        name: product_category.name
      }
    }
    must_redirect_to product_categories_path
  end

  it "destroys a product category" do
    -> {
      delete product_category_path(product_category)
    }.must_change 'ProductCategory.count', -1
    must_redirect_to product_categories_path
  end
end
