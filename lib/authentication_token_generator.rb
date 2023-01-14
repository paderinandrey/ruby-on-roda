# frozen_string_literal: true

module AuthenticationTokenGenerator
  def self.call
    loop do
      random_token = SecureRandom.hex(40)
      break random_token unless User.where(authentication_token: random_token).any?
    end
  end
end
