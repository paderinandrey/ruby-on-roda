# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'database_cleaner/redis'

require_relative '../app'

root_path = Pathname.new(File.expand_path('..', __dir__))
Dir[root_path.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.define_derived_metadata(file_path: /requests/) do |meta|
    meta[:type] = :request
  end

  config.before(:suite) do
    DatabaseCleaner[:redis].db = ENV.fetch('REDIS_URL', 'redis://172.0.0.1:6379/0')
    DatabaseCleaner[:redis].clean_with(:deletion)
  end

  config.around do |example|
    DatabaseCleaner[:redis].cleaning do
      example.run
    end
  end
end
