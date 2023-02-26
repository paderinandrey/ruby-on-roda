# frozen_string_literal: true

class AuthorizationTokenValidator
  def initialize(authorization_token:, purpose:)
    @authorization_token = extract_token(authorization_token)
    @purpose = purpose
  end

  def call
    return current_user if current_user && current_user.authentication_token == data[:authentication_token]

    raise(ActiveSupport::MessageVerifier::InvalidSignature)
  end

  private

  def data
    @data ||= MessageVerifier.decode(message: @authorization_token, purpose: @purpose)
  end

  def current_user
    @current_user ||= User.find(id: data[:user_id])
  end

  def extract_token(token)
    token.split(' ').last if token.start_with?('Bearer ')
  end
end
