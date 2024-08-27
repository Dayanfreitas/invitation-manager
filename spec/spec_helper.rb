ENV["RAILS_ENV"] = 'test'
require 'shoulda/matchers'

require 'support/factory_bot.rb'
require 'support/rspec-rails'
require 'support/simplecov'
require 'support/fuubar'

require "rspec/json_expectations"


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = [:expect, :should]
  end

  config.include Shoulda::Matchers::ActiveRecord, type: :model

  config.mock_with :rspec

  config.example_status_persistence_file_path = 'spec/specs_reports.txt'
end
