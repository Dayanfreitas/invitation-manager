source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.0"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
gem "devise", '4.9'
gem 'jwt'
gem 'jbuilder', '2.12.0'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'test-unit', '3.6.2'
  gem 'rspec', '3.13.0'
  gem 'rspec-rails', '6.1.1'
  gem 'rspec-mocks', '3.13.0'
  gem 'rspec-json_expectations', '2.2.0'
  gem 'shoulda', '4.0.0'
  gem 'shoulda-matchers', ' 4.5.1'
  gem 'byebug', '11.1.3'
  gem 'rubocop-checkstyle_formatter', '0.4.0', require: false
  gem 'rubocop', '0.79', require: false
  gem 'brakeman', '6.1.1', require: false
  gem 'overcommit', '0.63.0'
  gem 'fasterer', '0.11.0'
  gem 'factory_bot_rails', '6.4.3'
  gem 'faker', '3.4.1'
  gem 'fuubar', '2.5.1'
  gem 'bundler-audit', '0.9.1'
  gem 'rails_best_practices', '1.23.2'
  gem 'tty-spinner', '0.9.3'
end

group :test do
  gem 'simplecov', '0.22.0'
  gem 'rspec-sidekiq', '4.1.0'
  # gem 'sidekiq-status', '3.0.3'
  gem 'rails-controller-testing', '1.0.5'
  gem 'database_cleaner-active_record', '2.2.0'
end


group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

