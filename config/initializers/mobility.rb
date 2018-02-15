Mobility.configure do |config|
  config.default_backend = :table
  config.accessor_method = :translates
  config.query_method    = :i18n
  # config.fallbacks_generator = 

  config.default_options[:dirty]            = true
  config.default_options[:locale_accessors] = true

end
