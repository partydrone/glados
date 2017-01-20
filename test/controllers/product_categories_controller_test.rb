require 'test_helper'

describe ProductCategoriesController, :locale do
  it "gets show" do
    get product_category_path(product_categories(:intersection))
    must_respond_with :success
  end
end
