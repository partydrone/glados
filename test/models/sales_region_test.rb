require 'test_helper'

describe SalesRegion do
  let(:sales_region) { SalesRegion.new(name: 'Asia & Australia') }

  it "is a valid object" do
    sales_region.must_be :valid?
  end

  it "requires a name" do
    sales_region.name = ' '
    sales_region.wont_be :valid?
  end

  it "has sales_territories" do
    sales_region.must_respond_to :sales_territories
  end

  it "has sales offices" do
    sales_region.must_respond_to :sales_offices
  end
end
