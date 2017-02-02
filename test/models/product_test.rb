require 'test_helper'

describe Product do
  let(:product) { Product.new(name: 'SmartSensor HD', part_number: '101-0415', summary: 'SmartSensor HD summary.', description: 'SmartSensor HD description.', product_category_id: product_categories(:arterial).id, hero_image_id: 1, product_image_id: 1) }

  it "is a valid object" do
    product.must_be :valid?
  end

  it "requires a name" do
    product.name = ' '
    product.wont_be :valid?
  end

  it "requires a part number" do
    product.part_number = ' '
    product.wont_be :valid?
  end

  it "requires a product category" do
    product.product_category_id = nil
    product.wont_be :valid?
  end

  it "has an expiration date" do
    product.must_respond_to :expired_on
  end

  it "requires a summary" do
    product.summary = ' '
    product.wont_be :valid?
  end

  it "requires a description" do
    product.description = ' '
    product.wont_be :valid?
  end

  it "requires a hero image" do
    product.hero_image_id = ''
    product.wont_be :valid?
  end

  it "requires a product image" do
    product.product_image_id = ''
    product.wont_be :valid?
  end

  it "is not discontinued" do
    product.expired_on = 1.week.from_now
    product.wont_be :discontinued?
  end

  it "is discontinued" do
    product.expired_on = 1.week.ago
    product.must_be :discontinued?
  end

  it "has associated downloads" do
    product.must_respond_to :downloads
  end

  it "has associated features" do
    product.must_respond_to :features
  end

  it "has associated patents" do
    product.must_respond_to :patents
  end
end
