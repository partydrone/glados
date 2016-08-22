require 'test_helper'

describe ProductsController do
  it "gets index" do
    get products_path
    follow_redirect!
    must_respond_with :success
  end
end
