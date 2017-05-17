source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1'

##
# Defaults
gem 'bcrypt', '~> 3.1.7'
# gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5.x'
gem 'uglifier', '>= 1.3.0'

#nested_form
gem 'nested_form_fields'

##
# Authentication
gem 'omniauth-identity'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2', github: 'decioferreira/omniauth-linkedin-oauth2', branch: 'master'
gem 'omniauth-azure-activedirectory'
gem 'pundit'
gem 'rolify'

##
# Background job processing
gem 'sidekiq', '~> 4.1'
# gem 'clockwork', '~> 2.0' # for recurring background tasks without needing cron

##
# Browser check
gem 'browser'

##
# File uploads
gem 'aws-sdk', '~> 2.1'
gem 'refile', require: 'refile/rails', github: 'refile', branch: 'master'
gem 'sinatra', '~> 2.0'
gem 'refile-mini_magick'
gem 'refile-s3'

##
# Forms
gem 'ckeditor'
gem 'client_side_validations'

##
# Front-end
gem 'foundation-rails', '~> 6.2.0'
gem 'redcarpet', '~> 3.0'

##
# I18n
# gem 'globalize'
gem 'rails-i18n', '~> 5.0.0'

##
# List sorting
gem 'acts_as_list'
gem 'jquery-ui-rails', '~> 5.0'
gem 'record_tag_helper', '~> 1.0'

##
# Profiling
gem 'rack-mini-profiler', '~> 0.10'
gem 'flamegraph'
gem 'stackprof'

##
# Search
gem 'pg_search'

##
# Tagging
gem 'acts-as-taggable-on', '~> 4.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'debase'
  gem 'puma', '~> 3.0'
  gem 'ruby-debug-ide'
end

group :production, :staging do
  gem 'unicorn'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
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
