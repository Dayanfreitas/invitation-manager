require 'database_cleaner/active_record'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.after(:all) do
    DatabaseCleaner.strategy = :transaction
  end
  
  config.before(:all) do
    DatabaseCleaner.start
  end
  
  config.after(:all) do
    DatabaseCleaner.clean
  end
end