# frozen_string_literal: true

module RedisHelpers
  def redis
    @redis ||= Container['persistance.redis']
  end

  def self.included(rspec)
    rspec.around do |example|
      with_clean_redis do
        example.run
      end
    end
  end

  def with_clean_redis
    redis.flushall
    begin
      yield
    ensure
      redis.flushall
    end
  end
end

RSpec.configure do |config|
  config.include RedisHelpers, type: :throttling
end
