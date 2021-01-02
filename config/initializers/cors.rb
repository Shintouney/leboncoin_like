# config/initializers/cors.rb
Rails.application.config.hosts << "vicopo.selfbuild.fr"
Rails.application.config.hosts << "selfbuild.fr"
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000'
    resource 'vicopo.selfbuild.fr', headers: :any, methods: [:get, :post, :patch, :put]
  end
end
