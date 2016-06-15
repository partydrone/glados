module Minitest::Assertions
  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but cannot."
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but can."
    refute permit(user, record, action), msg
  end

  def permit(user, record, action)
    cls = self.class.superclass.to_s.gsub(/Test/, "")
    cls.constantize.new(user, record).public_send("#{action.to_s}?")
  end
end

module Minitest::Expectations
  ##
  # See MiniTest::Assertions#assert_permit
  #
  #   record.must_permit user, action

  infect_an_assertion :assert_permit, :must_permit

  ##
  # See Minitest::Assertions#refute_permit
  #
  #   record.wont_permit user, action

  infect_an_assertion :refute_permit, :wont_permit
end
