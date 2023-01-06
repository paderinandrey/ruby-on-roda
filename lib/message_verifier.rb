# frozen_string_literal: true

class MessageVerifier
  class << self
    def encode(data:, expires_at:, purpose:)
      verifier.generate(data, expires_at:, purpose:)
    end

    def decode(message:, purpose:)
      verifier.verify(message, purpose:)
    end

    private

    def verifier
      ActiveSupport::MessageVerifier.new(ENV.fetch('SECRET_KEY_BASE', nil), digest: 'SHA512')
    end
  end
end
