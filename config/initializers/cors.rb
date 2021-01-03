# config/initializers/cors.rb

Rails.application.config.middleware.insert_after Rails::Rack::Logger, Rack::Cors, :debug => true, :logger => Rails.logger do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end
