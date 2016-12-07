require_relative 'production.rb'

Rails.application.configure do
  # Overwrite any production settings here, or if you want to start from
  # scratch, then remove line 1.

  # Full error reports are enabled.
  config.consider_all_requests_local = true

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.action_controller.asset_host = '//dw8wks5reei42.cloudfront.net'
end
