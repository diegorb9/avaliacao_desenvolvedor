# frozen_string_literal: true

require File.expand_path('boot', __dir__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalesImporter
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.active_record.raise_in_transactional_callbacks = true

    config.i18n.default_locale = 'pt-BR'
    config.time_zone = 'Brasilia'

    config.generators do |g|
      g.assets         false
      g.helper         false
      g.test_framework nil
    end
  end
end
