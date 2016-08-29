require 'test_helper'

describe ProductsController, :locale do
  it "gets index" do
    get products_path
    must_respond_with :success
  end
end
