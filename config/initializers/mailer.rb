Rails.application.configure do
  # Action mailer settings
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              ENV['SMTP_ADDRESS'],
    port:                 ENV['SMTP_PORT'].to_i,
    domain:               ENV['SMTP_DOMAIN'],
    user_name:            ENV['SMTP_USERNAME'],
    password:             ENV['SMTP_PASSWORD'],
    authentication:       ENV['SMTP_AUTH'],
    enable_starttls_auto: ENV['SMTP_ENABLE_STARTTLS_AUTO'] == 'true'
  }

  config.action_mailer.default_url_options = {
    host: ENV['ACTION_MAILER_HOST']
  }

  config.action_mailer.default_options = {
    from: ENV['ACTION_MAILER_DEFAULT_FROM']
  }
end
