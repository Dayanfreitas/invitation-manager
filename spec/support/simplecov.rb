
require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start :rails do
  add_group "Repositories", "lib/application/repository"
  add_group "Services", "lib/application/services"

  add_filter [
    "channels",
    "helpers",
    "jobs",
  ]
end
