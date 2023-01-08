# frozen_string_literal: true

require 'bundler/setup'
require 'dry/system'
require 'pry'
require 'zeitwerk'

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  use :zeitwerk

  configure do |config|
    config.component_dirs.add('lib')
    config.component_dirs.add('app') do |dir|
      dir.memoize = true
      dir.namespaces.add('models', key: nil, const: nil)
      dir.namespaces.add('serializers', key: nil, const: nil)
    end
  end

  class << self
    %i[development test production].each do |environment|
      define_method("#{environment}?") do
        env == environment
      end
    end
  end
end

Import = Container.injector
