Rails.application.configure do
  config.web_console.whitelisted_ips = '172.18.0.0/16' if Rails.env.development?
end
