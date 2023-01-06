# frozen_string_literal: true

module ApiHelpers
  def response
    last_response
  end

  def json_response
    JSON.parse(response.body)
  end

  def access_token(user)
    AccessTokenGenerator.new(user:).call
  end

  def refresh_token(user)
    RefreshTokenGenerator.new(user:).call
  end
end

RSpec.configure do |config|
  config.include ApiHelpers
end
