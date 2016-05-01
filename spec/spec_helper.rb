ENV['RAILS_ENV'] ||= 'test'
require "simplecov"

if ENV["CIRCLE_ARTIFACTS"]
  dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start "rails"

SimpleCov.start do
  add_filter '/config/'
  add_filter '/spec/'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'API', 'app/controllers/api'
  add_group 'Serializers', 'app/serializers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Jobs', 'app/jobs'
end

require "webmock/rspec"

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)

def json_response
  JSON.parse(response.body)
end
