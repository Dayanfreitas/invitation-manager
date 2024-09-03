
require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start :rails do
  add_group "Repositories", "lib/application/repository"
  add_group "Services", "lib/application/services"
  add_group "Query Builder", "lib/application/query_build"

  add_filter [
    "channels",
    "helpers",
    "jobs",
  ]
end
