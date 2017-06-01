require 'test_helper'

describe Dealer do
  let(:dealer) { Dealer.new(name: 'Slagg Rock, Inc.', address: '1 Boulder Place', locality: 'Bedrock', region: nil, postal_code: nil, country_id: 'US', phone: nil, email: nil, website: nil) }

  it "is a valid object" do
    dealer.must_be :valid?
  end

  it "requires a name" do
    dealer.name = ' '
    dealer.wont_be :valid?
  end

  it "requires an address" do
    dealer.address = ' '
    dealer.wont_be :valid?
  end

  it "requires a locality, region, or postal code" do
    dealer.locality, dealer.region, dealer.postal_code = ' '
    dealer.wont_be :valid?
  end

  it "requires a country" do
    dealer.country_id = ' '
    dealer.wont_be :valid?
  end

  it "has a phone number" do
    dealer.must_respond_to :phone
  end

  it "accepts a valid email address" do
    addresses = %w(
      user@foo.com
      THE_USER@mail.example.com
      first.last@foo.jp
      a+b@foo.cn
      a-b@foo.org
    )
    addresses.each do |valid_email|
      dealer.email = valid_email
      dealer.must_be :valid?
    end
  end

  it "rejects an invalid email address" do
    addresses = %w(
      user@foo,com
      user_at_foo.org
      example.user@foo.
      foo@bar+baz.com
    )
    addresses.each do |invalid_email|
      dealer.email = invalid_email
      dealer.wont_be :valid?
    end
  end

  it "allows an empty email address" do
    dealer.email = ' '
    dealer.must_be :valid?
  end

  it "accepts a valid web site address" do
    urls = %w[
      http://wavetronix.com
      http://www.wavetronix.com
      https://summit-traffic.co.uk
      http://www.wavetronix.com/products
    ]
    urls.each do |valid_url|
      dealer.website = valid_url
      dealer.must_be :valid?
    end
  end

  it "rejects an invalid web site address" do
    urls = %w[wavetronix.com www.wavetronix]
    urls.each do |invalid_url|
      dealer.website = invalid_url
      dealer.wont_be :valid?
    end
  end

  it "allows an empty web site address" do
    dealer.website = ' '
    dealer.must_be :valid?
  end

  it "has a sales territory" do
    dealer.must_respond_to :sales_territories
  end
end
