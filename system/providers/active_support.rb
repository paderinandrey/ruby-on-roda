# frozen_string_literal: true

Container.register_provider(:active_support) do
  prepare do
    require 'active_support/json'
    require 'active_support/message_verifier'
  end

  start do
    ActiveSupport::JSON::Encoding.time_precision = 0
  end
end
