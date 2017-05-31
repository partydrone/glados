require 'test_helper'

describe ProductCategory do
  let(:product_category) { ProductCategory.new(name: 'Arterial', product_type: product_types(:detection), hero_image_id: 1, icon_image_id: 1) }

  it "is a valid object" do
    product_category.must_be :valid?
  end

  it "requires a name" do
    product_category.name = ' '
    product_category.wont_be :valid?
  end

  it "requires a hero image" do
    product_category.hero_image_id = ''
    product_category.wont_be :valid?
  end

  it "requires an icon image" do
    product_category.icon_image_id = ''
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

  it "has active products" do
    product_category.must_respond_to :active_products
  end
end
