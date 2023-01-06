# frozen_string_literal: true

class AuthorizationTokensGenerator
  def initialize(user:)
    @user = user
  end

  def call
    {
      access_token: { token: access_token, expires_in: 300 },
      refresh_token: { token: refresh_token, expires_in: 900 }
    }
  end

  private

  def access_token
    AccessTokenGenerator.new(user: @user).call
  end

  def refresh_token
    RefreshTokenGenerator.new(user: @user).call
  end
end
