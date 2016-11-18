require 'test_helper'

describe User::Authentication do
  let(:user) { User.new(provider: 'identity', uid: '1234567890', first_name: 'Bilbo', last_name: 'Baggins', email: 'bilbo.baggins@bagend.com') }

  it "has an auth token" do
    user.must_respond_to :auth_token
  end

  it "generates an auth token before saving" do
    user.save
    found_user = User.find_by(email: user.email)
    found_user.auth_token.wont_be_nil
  end
end
