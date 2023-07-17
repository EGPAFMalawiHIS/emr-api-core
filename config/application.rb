require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EmrApiCore
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_Controller :responders_Controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join('lib')

    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb # Hide unwanted generators
      g.template_engine :slim # Select template engine
      g.helper false # Don't create view helpers
      g.test_framework  :rspec, :view_specs => false
      g.integration_tool :rspec
      g.fixture_replacement :fixtures # Choose between fixtures and factories
      g.factory_bot dir: 'spec/factories'
      g.javascript_engine :js # Disable coffeescript
      g.scaffold_Controller "responders_Controller" # from responders gem
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
