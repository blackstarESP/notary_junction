# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NotaryJunction
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Add font, image and other assets paths for MD MDBootstrap
    config.assets.paths << Rails.root.join("app", "assets", "font", "roboto")
    config.assets.paths << Rails.root.join("vendor", "assets", "img")
    config.assets.paths << Rails.root.join("vendor", "assets", "mdb-addons")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
