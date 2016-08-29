require 'test_helper'

describe User::Authorization do
  let(:user) { User.new(provider: 'identity', uid: '1234567890', first_name: 'Bilbo', last_name: 'Baggins', email: 'bilbo.baggins@bagend.com') }

  it "has a role" do
    user.must_respond_to :roles
  end
end
