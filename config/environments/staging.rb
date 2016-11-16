require_relative 'production.rb'

Rails.application.configure do
  # Overwrite any production settings here, or if you want to start from
  # scratch, then remove line 1.

  config.consider_all_requests_local = true
end
