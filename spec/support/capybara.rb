require 'capybara/rails'
require 'capybara/rspec'

Capybara::Webkit.configure do |config|
  # Silently return an empty 200 response for any requests to unknown URLs.
  config.block_unknown_urls

  # Raise JavaScript errors as exceptions
  config.raise_javascript_errors = false
end

Capybara.configure do |config|
  #config.server = :webrick
  config.server = :puma
  config.javascript_driver = :webkit
  #config.threadsafe = true
  config.default_max_wait_time = 10
  config.server_port = 9887
end
