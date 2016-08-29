OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:identity] = OmniAuth::AuthHash.new({
  provider: 'identity',
  uid: '1234567891',
  info: {
    first_name: 'Saruman',
    last_name: 'the Wise',
    email: 'saruman@orthanc.com'
  }
})
