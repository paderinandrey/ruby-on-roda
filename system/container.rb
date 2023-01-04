# frozen_string_literal: true

require 'bundler/setup'
require 'dry/system/container'
require 'pry'
require 'zeitwerk'

class Container < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
  use :zeitwerk
end

Import = Container.injector
