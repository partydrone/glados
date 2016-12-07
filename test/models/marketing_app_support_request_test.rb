require 'test_helper'

describe MarketingAppSupportRequest do
  let :marketing_app_support_request do
    MarketingAppSupportRequest.new(
      name:    'Bono',
      email:   'bono@u2.com',
      description: "I still haven't found what I'm looking for."
    )
  end

  it "is a valid object" do
    marketing_app_support_request.must_be :valid?
  end

  it "requires a name" do
    marketing_app_support_request.name = ' '
    marketing_app_support_request.wont_be :valid?
  end

  it "requires an email address" do
    marketing_app_support_request.email = ' '
    marketing_app_support_request.wont_be :valid?
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
      marketing_app_support_request.email = valid_email
      marketing_app_support_request.must_be :valid?
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
      marketing_app_support_request.email = invalid_email
      marketing_app_support_request.wont_be :valid?
    end
  end

  it "requires a description" do
    marketing_app_support_request.description = ' '
    marketing_app_support_request.wont_be :valid?
  end
end
