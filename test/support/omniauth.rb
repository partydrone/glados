OmniAuth.config.test_mode = true

identity_hash = {
  provider: 'identity',
  uid: '1234567890',
  info: {
    first_name: 'Mock',
    last_name: 'User',
    email: 'mock.user@example.com'
  }
}

OmniAuth.config.add_mock(:identity, identity_hash)
