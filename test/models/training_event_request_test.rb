require 'test_helper'

describe TrainingEventRequest do
  let :training_event_request do
    TrainingEventRequest.new(
      company_name: 'ACME',
      full_name: 'Wile E. Coyote',
      email: 'wile.e.coyote@wb.com',
      phone: '(123) 456-7890',
      address: '1 Wilderness Ave',
      locality: 'Anywhere',
      region: 'AZ',
      postal_code: '12345',
      country_id: 'US',
      started_at: 8.days.from_now.to_s(:db),
      ended_at: 10.days.from_now.to_s(:db),
      capacity: '50'
    )
  end

  it "is a valid object" do
    training_event_request.must_be :valid?
  end

  it "requires a company name" do
    training_event_request.company_name = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a name" do
    training_event_request.full_name = ' '
    training_event_request.wont_be :valid?
  end

  it "requires an email address" do
    training_event_request.email = ' '
    training_event_request.wont_be :valid?
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
      training_event_request.email = valid_email
      training_event_request.must_be :valid?
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
      training_event_request.email = invalid_email
      training_event_request.wont_be :valid?
    end
  end

  it "requires an address" do
    training_event_request.address = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a locality" do
    training_event_request.locality = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a region" do
    training_event_request.region = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a postal code" do
    training_event_request.postal_code = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a country" do
    training_event_request.country_id = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a start date and time" do
    training_event_request.started_at = ' '
    training_event_request.wont_be :valid?
  end

  it "requires an end date and time" do
    training_event_request.ended_at = ' '
    training_event_request.wont_be :valid?
  end

  it "requires a capacity" do
    training_event_request.capacity = ' '
    training_event_request.wont_be :valid?
  end

  it "requires that capacity be a number" do
    training_event_request.capacity = 'fifty'
    training_event_request.wont_be :valid?
  end

  it "accepts capacity values greater than 0" do
    [1, 10, 100].each do |val|
      training_event_request.capacity = val
      training_event_request.must_be :valid?
    end
  end

  it "rejects capacity values less than 1" do
    [0, -1, -10, -100].each do |val|
      training_event_request.capacity = val
      training_event_request.wont_be :valid?
    end
  end
end
