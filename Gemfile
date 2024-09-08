# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'
gem 'acts-as-taggable-on'
gem 'aws-sdk-s3', require: false
gem 'draper'
gem 'faraday'
gem 'friendly_id', '~> 5.5.0'
gem 'grover'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.1.3'
gem 'rails-i18n', '~> 7.0.0'
gem 'redis', '~> 5.2'
gem 'requestjs-rails'
gem 'rollbar'
gem 'roo'
gem 'sidekiq', '~> 7.2'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'wicked'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Frontend - start
gem 'cssbundling-rails'
gem 'jsbundling-rails'
# Frontend - end

# block-start:ActiveAdmin
gem 'activeadmin'
gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'inherited_resources'
gem 'pundit'
gem 'sassc-rails'

# block-end:ActiveAdmin
group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bootsnap', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'shoulda-matchers', '~> 6.0'
end

group :development do
  gem 'annotate'
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'foreman'
  gem 'rack-mini-profiler'
  gem 'rails-erd'
  gem 'web-console'
  gem 'yard'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

## Facebook/Instagram API
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
##
