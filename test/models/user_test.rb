require 'test_helper'

describe User do
  let(:user) { User.new(provider: 'identity', uid: '1234567890', first_name: 'Bilbo', last_name: 'Baggins', email: 'bilbo.baggins@bagend.com') }

  it "is a valid object" do
    user.must_be :valid?
  end

  it "requires a provider" do
    user.provider = ' '
    user.wont_be :valid?
  end

  it "requires a UID" do
    user.uid = ' '
    user.wont_be :valid?
  end

  it "requires a first name" do
    user.first_name = ' '
    user.wont_be :valid?
  end

  it "requires a last name" do
    user.last_name = ' '
    user.wont_be :valid?
  end

  it "generates a full name" do
    user.first_name = 'Mickey'
    user.last_name = 'Mouse'
    user.name.must_equal 'Mickey Mouse'
  end

  it "requires an email address" do
    user.email = ' '
    user.wont_be :valid?
  end
end
