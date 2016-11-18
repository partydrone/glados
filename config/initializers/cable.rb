Rails.application.configure do
  # Action Cable setting to de-couple it from the main Rails process.
  config.action_cable.url = ENV['ACTION_CABLE_FRONTEND_URL']

  # Action Cable setting to allow connections from these domains.
  origins = ENV['ACTION_CABLE_ALLOWED_REQUEST_ORIGINS'].split(',')
  origins.map! { |url| /#{url}/ }
  config.action_cable.allowed_request_origins = origins
end
