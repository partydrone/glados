require 'test_helper'

describe ProductCategory do
  let(:product_category) { ProductCategory.new(name: 'Arterial', product_type: product_types(:detection)) }

  it "is a valid object" do
    product_category.must_be :valid?
  end

  it "requires a name" do
    product_category.name = ' '
    product_category.wont_be :valid?
  end

  it "has a Product Type" do
    product_category.must_respond_to :product_type
  end

  it "requires a Product Type" do
    product_category.product_type = nil
    product_category.wont_be :valid?
  end

  it "has products" do
    product_category.must_respond_to :products
  end
end
