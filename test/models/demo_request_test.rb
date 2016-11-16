require 'test_helper'

describe DemoRequest do
  let(:demo_request) { DemoRequest.new(name: 'Barney Miller', email: 'bmiller@nypd.org', country: 'US') }

  it "is a valid object" do
    demo_request.must_be :valid?
  end

  it "requires a name" do
    demo_request.name = ' '
    demo_request.wont_be :valid?
  end

  it "requires an email address" do
    demo_request.email = ' '
    demo_request.wont_be :valid?
  end

  it "accepts a valid email address" do
    addresses = %w[user@foo.com THE_USER@mail.example.com first.last@foo.jp a+b@foo.cn a-b@foo.org]
    addresses.each do |valid_email|
      demo_request.email = valid_email
      demo_request.must_be :valid?
    end
  end

  it "rejects an invalid email address" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar+baz.com]
    addresses.each do |invalid_email|
      demo_request.email = invalid_email
      demo_request.wont_be :valid?
    end
  end
end
