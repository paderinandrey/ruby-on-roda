# frozen_string_literal: true

class AccessTokenGenerator
  def initialize(user:)
    @user = user
  end

  def call
    data = { user_id: @user.id, authentication_token: @user.authentication_token }

    MessageVerifier.encode(data:, expires_at: Time.now + 300, purpose: :access_token)
  end
end
