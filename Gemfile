source 'https://rubygems.org'

gem 'rails', '>= 5.0.0', '< 5.1'

# Defaults
gem 'bcrypt', '~> 3.1.7'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
# gem 'turbolinks', '~> 5.x'
gem 'uglifier', '>= 1.3.0'

# Authentication
gem 'omniauth-identity'
gem 'pundit'
gem 'rolify'

# File uploads
gem 'mini_magick'
gem 'refile', require: 'refile/rails'
# gem 'refile-mini_magick'
# gem 'refile-s3'

# Front-end
gem 'foundation-rails', '~> 6.0'
gem 'redcarpet', '~> 3.0'

# I18n
# gem 'globalize'
gem 'rails-i18n', '~> 5.0.0'

# List sorting
gem 'acts_as_list'
gem 'jquery-ui-rails'
gem 'record_tag_helper', '~> 1.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'puma', '~> 3.0'
end

group :production, :staging do
  gem 'unicorn'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-rails', '~> 3.0.0'
  gem 'minitest-rails-capybara', '~> 3.0.0'
  gem 'minitest-reporters'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
