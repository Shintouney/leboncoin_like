require_relative 'boot'
require "active_storage/engine"
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inc
  class Application < Rails::Application
    config.load_defaults 6.0
    config.active_storage.replace_on_assign_to_many = false
    config.hosts << "http://localhost:3000"
    config.hosts << "localhost"
    config.hosts << "vicopo.selfbuild.fr"
    config.hosts << "http://vicopo.selfbuild.fr"
    config.hosts <<  /.*\.selfbuild\.fr/
		config.hosts.clear
    config.i18n.default_locale = :'fr'
		config.middleware.use Rack::JSONP
    config.to_prepare do
      Devise::SessionsController.layout "home_unlogged"
      Devise::RegistrationsController.layout "home_unlogged"
    end
  end
end
