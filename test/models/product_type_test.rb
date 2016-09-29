require 'test_helper'

describe ProductType do
  let(:product_type) { ProductType.new(name: 'SmartSensor') }

  it "is a valid object" do
    product_type.must_be :valid?
  end

  it "requires a name" do
    product_type.name = ' '
    product_type.wont_be :valid?
  end

  it "has product categories" do
    product_type.must_respond_to :product_categories
  end

  it "has products" do
    product_type.must_respond_to :products
  end
end
