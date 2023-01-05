# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../app'

root_path = Pathname.new(File.expand_path('..', __dir__))
Dir[root_path.join('spec/support/**/*.rb')].each { |f| require f }
