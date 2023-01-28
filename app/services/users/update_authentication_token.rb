# frozen_string_literal: true

module Users
  class UpdateAuthenticationToken
    def initialize(user:)
      @user = user
    end

    def call
      @user.update(authentication_token:)
    end

    private

    def authentication_token
      AuthenticationTokenGenerator.call
    end
  end
end
