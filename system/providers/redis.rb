# frozen_string_literal: true

Container.register_provider(:redis) do
  prepare { require 'redis' }

  start do
    target_container.start(:settings)

    uri = URI.parse(target[:settings].redis_url)
    redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)

    register('persistance.redis', redis)
  end
end
