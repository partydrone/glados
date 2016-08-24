require 'test_helper'

describe Identity do
  let(:identity) { Identity.new(first_name: 'Gimli', last_name: 'Son of Gloin', email: 'gimli@thelonelymountain.com', password: 'gloin', password_confirmation: 'gloin') }

  it "is a valid object" do
    identity.must_be :valid?
  end

  it "requires a first name" do
    identity.first_name = ' '
    identity.wont_be :valid?
  end

  it "requires a last name" do
    identity.last_name = ' '
    identity.wont_be :valid?
  end

  it "requires an email address" do
    identity.email = ' '
    identity.wont_be :valid?
  end

  it "accepts a valid email address" do
    addresses = %w[user@foo.com THE_USER@mail.example.com first.last@foo.jp a+b@foo.cn a-b@foo.org]
    addresses.each do |valid_email|
      identity.email = valid_email
      identity.must_be :valid?
    end
  end

  it "rejects an invalid email address" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_email|
      identity.email = invalid_email
      identity.wont_be :valid?
    end
  end

  it "rejects a duplicate email address" do
    duplicate_user = identity.dup
    duplicate_user.email = identity.email.upcase
    duplicate_user.save
    identity.wont_be :valid?
  end

  it "has a password digest field" do
    identity.must_respond_to :password_digest
  end

  it "has a password field" do
    identity.must_respond_to :password
  end

  it "has a password confirmation field" do
    identity.must_respond_to :password_confirmation
  end

  it "requires a password" do
    identity.password = identity.password_confirmation = ' '
    identity.wont_be :valid?
  end

  it "rejects a nil password confirmation" do
    identity.password_confirmation = nil
    identity.wont_be :valid?
  end
end
