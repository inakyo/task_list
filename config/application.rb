require_relative "boot"

#require "rails/all"
require "rails"

require "active_record/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppName
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.active_record.default_timezone = :local
    config.time_zone = 'Asia/Tokyo'
    #config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
