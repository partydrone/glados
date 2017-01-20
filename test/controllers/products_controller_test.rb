require 'test_helper'

describe ProductsController, :locale do
  it "gets show" do
    get product_path(products(:smartsensor_hd))
    must_respond_with :success
  end
end
