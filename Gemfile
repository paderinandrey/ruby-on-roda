# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.2'

# Routing Tree Web Toolkit.
gem 'roda', '>= 3.63'

# Use Puma as the app server.
gem 'puma', '~> 6.6'

# A make-like build utility for Ruby.
gem 'rake'

# Provides a command line interface for running a Rack-compatible application.
gem 'rackup'

# Sequel: The Database Toolkit for Ruby.
gem 'sequel', '>= 5.64'

# Faster SELECTs when using Sequel with pg.
gem 'sequel_pg', '>= 1.17'

# A runtime developer console and IRB alternative with powerful introspection capabilities.
gem 'pry'

# YARD is a Ruby Documentation tool. The Y stands for "Yay!"
gem 'yard'

# A fast JSON parser and Object marshaller as a Ruby gem.
gem 'oj'

# bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.
gem 'bcrypt'

# Validation library with type-safe schemas and rules.
gem 'dry-validation'

# A powerful logger for Roda with a few tricks up it's sleeve.
gem 'roda-enhanced_logger'

# Organize your code into reusable components.
gem 'dry-system', '1.2.2'

# A toolkit of support libraries and Ruby core extensions extracted from the Railsframework.
gem 'activesupport', '~> 8.0.2'

# Plugin that adds BCrypt authentication and password hashing to Sequel models.
gem 'sequel_secure_password'

# A gem providing "time travel" and "time freezing" capabilities, making it dead simple to test time-dependent code. It provides a unified method to mock Time.now, Date.today, and DateTime.now in a single call.
gem 'timecop'

# Ruby internationalization and localization (i18n) solution.
gem 'i18n'

# Thread-safe code loader
gem 'zeitwerk'

group :development, :test do
  # A library for setting up Ruby objects as test data.
  gem 'factory_bot'

  # A Ruby gem to load environment variables from `.env`.
  gem 'dotenv'

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem 'rubocop'

  # Code style checking for factory_bot files.
  gem 'rubocop-factory_bot', require: false

  # An extension of RuboCop focused on code performance checks.
  gem 'rubocop-performance'

  # Code style checking for RSpec files.
  gem 'rubocop-rspec'

  # Thread-safety analysis for your projects.
  gem 'rubocop-thread_safety'

  # Code style checking for Sequel.
  gem 'rubocop-sequel'

  # A RuboCop plugin for Rake
  gem 'rubocop-rake'

  # RSpec meta-gem that depends on the other components.
  gem 'rspec'

  # Rack::Test is a layer on top of Rack's MockRequest similar to Merb's RequestHelper.
  gem 'rack-test'

  # Rack middleware for blocking & throttling.
  gem 'rack-attack'

  # Redis is an in-memory database that persists on disk.
  gem 'redis', '5.4.0'
end

group :development do
  # An opinionated language server for Ruby
  gem 'ruby-lsp', '~> 0.25.0'
end

group :test do
  # Clean your Redis databases with Database Cleaner.
  gem 'database_cleaner-redis'
end
