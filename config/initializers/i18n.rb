I18n::Backend::Simple.send :include, I18n::Backend::Fallbacks

Rails.application.configure do
  config.i18n.load_path                += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  config.i18n.available_locales         = [:de, :en, :es, :fr, :"fr-FR", :it, :pt, :ru, :"zh-CN"]
  config.i18n.default_locale            = :en
  config.i18n.enforce_available_locales = false
end
