# frozen_string_literal: true

require 'bundler/setup'
require 'dry/system'
require 'pry'
require 'zeitwerk'

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  use :zeitwerk

  class << self
    %i[development test production].each do |environment|
      define_method("#{environment}?") do
        env == environment
      end
    end
  end
end

Import = Container.injector
