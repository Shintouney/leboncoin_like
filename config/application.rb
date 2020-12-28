require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inc
  class Application < Rails::Application
    config.load_defaults 6.0
    config.to_prepare do
      Devise::SessionsController.layout "home_unlogged"
      Devise::RegistrationsController.layout "home_unlogged"
    end
  end
end
