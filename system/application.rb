# frozen_string_literal: true

require "bundler/setup"
require "dry/system/container"

class Application < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("RACK_ENV", "development") }

  config.auto_register = %w[lib app]

  load_paths!("lib", "app")
end
